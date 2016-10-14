class MeetingRoomMessagesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_meeting_room_message, only: [:show, :edit, :update, :destroy]

  def index
    @meeting_room_messages = MeetingRoomMessage.all
  end

  def show
  end

  def new
    @meeting_room_message = MeetingRoomMessage.new
  end

  def edit
  end

  def create
    @meeting_room_message = MeetingRoomMessage.new(meeting_room_message_params)

    respond_to do |format|
      if @meeting_room_message.save
        format.html { redirect_to @meeting_room_message, notice: 'Meeting room message was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_room_message }
      else
        format.html { render :new }
        format.json { render json: @meeting_room_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meeting_room_message.update(meeting_room_message_params)
        format.html { redirect_to @meeting_room_message, notice: 'Meeting room message was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_room_message }
      else
        format.html { render :edit }
        format.json { render json: @meeting_room_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meeting_room_message.destroy
    respond_to do |format|
      format.html { redirect_to meeting_room_messages_url, notice: 'Meeting room message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def chatroom
    @member = @user.profilable.meeting_room_members.find_by(meeting_room_id: params[:meeting_room_id])
    if @member.present?
    else
      @member = @user.profilable.meeting_room_members.create(meeting_room_id: params[:meeting_room_id])
    end
    @meeting_room = @member.meeting_room
    @messages = @meeting_room.meeting_room_messages
    @members = @meeting_room.meeting_room_members
    @message = Message.new()
  end

  def send_message
    @m = @user.messages.new(message_params)
    if @m.save
      @message = @m
      @member = @user.profilable.meeting_room_members.find_by(meeting_room_id: params[:message][:meeting_room_id])
      puts "-----------------------#{@member}-------------------------"
      @meeting_room = @member.meeting_room
      @meeting_room_message = @meeting_room.meeting_room_messages.new(message_id: @message.id, meeting_room_member_id: @member.id)
      # respond_to do |format|
      #   if @meeting_room_message.save
      #     format.html { redirect_to :back, notice: 'Meeting Message was successfully sent.' }
      #     format.json { render :show, status: :created, location: @meeting_room_message }
      #   else
      #     @message.destroy
      #     format.html { redirect_to :back, alert: 'There was some error in sending the message.' }
      #   end
      # end
      if @meeting_room_message.save
        ActionCable.server.broadcast 'messages',
          message: @message.content,
          user: @message.user.name
        head :ok
      end

    else
      respond_to do |format|
        flash[:notice] = @m.errors
        format.html { redirect_to meeting_room_path(params[:message][:meeting_room_id]) }
        format.js { render template: 'messages/error.js.erb'}
      end
      # respond_to do |format|
      #   format.html { redirect_to :back, alert: 'There was some error in Sending the message. Make sure the message is not blank and does not execeed 140 characters.' }
      #   format.json { render :show, status: :created, location: @meeting_room_message }
      # end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_room_message
      @meeting_room_message = MeetingRoomMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_room_message_params
      params.require(:meeting_room_message).permit(:meeting_room_id, :meeting_member_id, :message_id)
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
