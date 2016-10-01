class MessagesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @current_user_received_messages = Message.where(target_id: current_user.id, topic_id: nil)
    @messages = current_user.messages.where(topic_id: nil)
    @message_thread = @messages | @current_user_received_messages
    puts @message_thread.as_json
    @conversations = User.where(id: current_user.messages.pluck(:target_id))
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
      puts "_______________"
      respond_to do |format|
        if current_user.reply_private_message(@topic, @content, {})
          format.html { redirect_to :back, notice: 'Message was successfully created.' }
          format.json { render :show, status: :created, location: @message }
        else
          format.html { render :new }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    else
      puts "**************"
      @message = Message.new(message_params)
      @target_user = User.find(params[:message][:target_id])
      @content = params[:message][:content]

      respond_to do |format|
        if current_user.send_private_message(@target_user, @content, {})
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
    @first_message = Message.where(id: params[:id])
    # @first_message.first.update(is_read: true)
    @read_status = Message.where(topic_id: @first_message.first.id,target_id: current_user.id).update_all(is_read: true)
    puts @first_message.first.user_id
    if @first_message.first.target_id == current_user.id
      @user = User.find(@first_message.first.user_id)
    else
      @user = User.find(@first_message.first.target_id)
    end
    @following_messages = Message.where(topic_id: @first_message.first.id)
    puts @following_messages.as_json
    puts "_________"
    @message_thread = @first_message | @following_messages
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
