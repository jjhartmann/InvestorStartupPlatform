class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  layout 'frontpage'
  before_action :authenticate_user!

  def index
    @meetings = @user.profilable.meetings.paginate(page: params[:page], per_page: 2)
  end

  def show
  end

  def new
    @meeting = Meeting.new
  end

  def edit
  end

  def create
    @meeting = Meeting.new(meeting_params)
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def meeting_request
    @enterprise = Enterprise.find(params[:requested_client_id])
    puts Time.parse(params[:meeting_start_time])
    @date = Date.parse(params[:meeting_date])
    @time = Time.parse(params[:meeting_start_time])
    @date_time = (@date + @time.seconds_since_midnight.seconds).to_datetime
    @meeting = Meeting.new(topic: params[:topic],start_time: @date_time + 6.hours, investor_profile_id: current_user.profilable.id, enterprise_id: @enterprise.id,acceptance_status: "requested")
    if @meeting.save
      puts "____________"
      puts @meeting.as_json
      @enterprise.enterprise_users.each do |member|
        @meeting_member = @meeting.meeting_members.build(memberable: member.user.profilable).save
        @notification = @meeting.notifications.create_notification(member.user.profilable_id, member.user.profilable_type, "#{current_user.name} have asked you to setup the meeting for following topic #{params[:topic]} on #{@meeting.start_time.strftime("#{@meeting.start_time.day.ordinalize} %B, %Y")} .", @meeting.class,{meeting_id: @meeting.id})
        puts "_____________"
        puts @notification.as_json
        puts @notification.meeting.as_json
        puts "_____________"
        ActionCable.server.broadcast 'create_notifications',
          notification: @notification,
          acceptance_status: @notification.notification_type == "Meeting" ? @notification.meeting.acceptance_status : "",
          notification_created_time: @notification.created_time
      end
      @saved = true
    else
      puts @meeting.errors.as_json
    end
    # head :ok
    # redirect_to :back
    respond_to do |format|
      format.js
    end
  end

  def accept_request
    @notification = Notification.find(params[:notification_id])
    if params[:status] == "1"
      @meeting_request = @notification.meeting.update(acceptance_status: "accepted",accepted_by: current_user.id)
      @meeting_room = @notification.meeting.create_meeting_room
    else
      @meeting_request = @notification.meeting.update(acceptance_status: "rejected",accepted_by: current_user.id)
    end
    @notification.meeting.notifications.each do |notification|
      ActionCable.server.broadcast 'notifications',
        notification: notification,
        acceptance_status: notification.meeting.acceptance_status,
        notification_li_class: notification.is_accepted(current_user),
        notification_created_time: notification.created_time
    end
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:topic, :start_time, :end_time, :enterprise_id, :user_id)
    end
end
