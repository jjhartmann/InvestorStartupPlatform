class MessagesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    # Unarchived Messages
    @message_sent_unarchived = current_user.inbox_messages
    @message_recieved_unarchived = Message.where(target_id: current_user.id).private_only.topics.without_proposal.unarchived
    @message_thread = (@message_sent_unarchived | @message_recieved_unarchived).sort_by(&:updated_at).reverse!

    # Archived Messages
    @message_sent_archived = current_user.archived_messages
    @message_recieved_archived = Message.where(target_id: current_user.id).private_only.topics.without_proposal.archived
    @message_thread_archived = (@message_sent_archived | @message_recieved_archived).sort_by(&:updated_at).reverse!
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    if params[:message][:topic_id].present?
      @topic = Message.find(params[:message][:topic_id])
      @content = params[:message][:content]
      @message_sent = @topic.user.id == current_user.id ? current_user.new_reply_private_message(@topic, @content) : current_user.reply_private_message(@topic, @content)
      puts @message_sent[1]
          ActionCable.server.broadcast 'messages',
                                       message: @message_sent[0].content,
                                       user: @message_sent[0].user.name,
                                       created_at: @message_sent[0].created_time,
                                       user_id: @message_sent[0].user.id,
                                       image: @message_sent[0].user.photo? ? @message_sent[0].user.photo_avatar.url : '/assets/user_50.jpeg'
          head :ok
          # format.html { redirect_to :back, notice: 'Message was successfully sent.' } and return
          # format.json { render :show, status: :created, location: @message }
        else
          puts "*************"
          respond_to do |format|
            format.html { render :new }
            format.json { render json: @message.errors, status: :unprocessable_entity }
            format.js { render template: 'error.js.erb' }
          end
      end
    else
      @message = Message.new(message_params)
      @target_user = User.find(params[:message][:target_id])
      @content = params[:message][:content]

      respond_to do |format|
        if current_user.send_private_message(@target_user, @content)
          format.html { redirect_to :back, notice: 'Message was successfully created.' }
          format.json { render :show, status: :created, location: @message }
        else
          format.html { render :new }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def inbox
    @first_message = Message.find(params[:id])
    if @first_message.target_id == current_user.id
      @user = User.find(@first_message.user_id)
    else
      @user = User.find(@first_message.target_id)
    end

    @following_messages = Message.where(topic_id: @first_message.id)
    @message_thread = Array.new
    @message_thread.push(@first_message)
    @message_thread = @message_thread | @following_messages

    @first_message.update(is_read: true)
    @message_thread.each do |read_message|
      if read_message.target_id == current_user.id
        read_message.update(is_read: true)
      end
    end
    # For the form
    @message = Message.new
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require('message').permit(:content, :is_read, :is_private, :is_archived, :target_id, :target_type, :proposal_id, :topic_id, :user_id)
  end
end
