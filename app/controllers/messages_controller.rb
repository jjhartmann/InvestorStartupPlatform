class MessagesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index

    # all the messages received by the current_user and are new conversations
    @current_user_received_messages = Message.where(target_id: current_user.id).topics

    # all the messages send by the current_user and are new conversations
    @messages = current_user.messages.topics
    @unsorted_message_thread = @messages | @current_user_received_messages
    puts "_____________________"
    puts @unsorted_message_thread.as_json
    puts "_____________________"
    @unsorted_message_thread1 = @unsorted_message_thread.sort! { |a,b| a.replies.unread.count <=> b.replies.unread.count }
    puts "_____________________"
    puts @unsorted_message_thread1.as_json
    puts "_____________________"
    @message_thread = @unsorted_message_thread1.sort! { |a,b| a.updated_at <=> b.updated_at }.reverse!
    puts "_________________________"
    puts @message_thread.as_json
    puts "_________________________"
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    if params[:message][:topic_id].present?
      @topic = Message.find(params[:message][:topic_id])
      @content = params[:message][:content]
      respond_to do |format|
        if @topic.user.id == current_user.id ? current_user.new_reply_private_message(@topic, @content) : current_user.reply_private_message(@topic, @content)
          format.html { redirect_to :back, notice: 'Message was successfully sent.' }
          format.json { render :show, status: :created, location: @message }
        else
          format.html { render :new }
          format.json { render json: @message.errors, status: :unprocessable_entity }
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

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
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

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def inbox
    @first_message = Message.find(params[:id])
    # @first_message.first.update(is_read: true)
    # @read_status = Message.where(topic_id: @first_message.first.id,target_id: current_user.id).update_all(is_read: true)
    @read_status = Message.where(topic_id: @first_message.id,target_id: current_user.id)
    puts "&&&&&&&&&&&&&&&&&&&&&"
    puts @read_status.as_json
    @first_message.update(is_read: true) if @first_message.target_id == current_user.id
    @read_status.each do |read_message|
      read_message.update(is_read: true)
    end
    puts @first_message.user_id
    if @first_message.target_id == current_user.id
      @user = User.find(@first_message.user_id)
    else
      @user = User.find(@first_message.target_id)
    end
    @following_messages = Message.where(topic_id: @first_message.id)
    # @following_messages = @first_message.replies
    puts @following_messages.as_json
    puts "_________"
    @message_thread = Array.new
    @message_thread.push(@first_message)
    @message_thread =  @message_thread | @following_messages
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
