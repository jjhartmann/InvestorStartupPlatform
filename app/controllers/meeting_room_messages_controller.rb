class MeetingRoomMessagesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_meeting_room_message, only: [:show, :edit, :update, :destroy]

  # GET /meeting_room_messages
  # GET /meeting_room_messages.json
  def index
    @meeting_room_messages = MeetingRoomMessage.all
  end

  # GET /meeting_room_messages/1
  # GET /meeting_room_messages/1.json
  def show
  end

  # GET /meeting_room_messages/new
  def new
    @meeting_room_message = MeetingRoomMessage.new
  end

  # GET /meeting_room_messages/1/edit
  def edit
  end

  # POST /meeting_room_messages
  # POST /meeting_room_messages.json
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

  # PATCH/PUT /meeting_room_messages/1
  # PATCH/PUT /meeting_room_messages/1.json
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

  # DELETE /meeting_room_messages/1
  # DELETE /meeting_room_messages/1.json
  def destroy
    @meeting_room_message.destroy
    respond_to do |format|
      format.html { redirect_to meeting_room_messages_url, notice: 'Meeting room message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def chatroom
    if @user.profilable.meeting_room_members.where(meeting_room_id: params[:meeting_room_message_id]).present?
    else
      @user.profilable.meeting_room_members.create(meeting_room_id: params[:meeting_room_message_id])
    end
  end

  def send_message

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
end
