class MeetingRoomsController < ApplicationController
  before_action :set_meeting_room, only: [:show, :edit, :update, :destroy]
  layout 'frontpage'
  before_action :authenticate_user!

  def index
    @meetings = @user.profilable.meetings.where(acceptance_status: "accepted").paginate(page: params[:page], per_page: 2)
  end

  def show
    @member = @user.profilable.meeting_room_members.find_or_create_by(meeting_room_id: params[:id])
    @message = Message.new
    @document = MeetingRoomMessageDocument.new
  end

  def new
    @meeting_room = MeetingRoom.new
  end

  def edit
  end

  def create
    @meeting_room = MeetingRoom.new(meeting_room_params)

    respond_to do |format|
      if @meeting_room.save
        format.html { redirect_to @meeting_room, notice: 'Meeting room was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_room }
      else
        format.html { render :new }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meeting_room.update(meeting_room_params)
        format.html { redirect_to @meeting_room, notice: 'Meeting room was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_room }
      else
        format.html { render :edit }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meeting_room.destroy
    respond_to do |format|
      format.html { redirect_to meeting_rooms_url, notice: 'Meeting room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_room
      @meeting_room = MeetingRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_room_params
      params.require(:meeting_room).permit(:meeting_id)
    end
end
