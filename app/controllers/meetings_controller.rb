class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
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

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
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

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def meeting_request
    # @target_user = User.find(params[:requested_client_id])
    @enterprise = Enterprise.find(params[:requested_client_id])
    @meeting = Meeting.create(topic: params[:topic],start_time: params[:meeting_start_time], end_time: params[:meeting_end_time], investor_profile_id: current_user.profilable.id, enterprise_id: @enterprise.id,acceptance_status: "requested")
    puts @enterprise.followers.where(id: @enterprise.followers.pluck(:id).delete(current_user.id)).as_json
    @enterprise.enterprise_users.each do |follower|
      puts "______________"
      puts follower.class
      puts "______________"
      @meeting_member = @meeting.meeting_members.build(memberable: follower).save
      @meeting.notifications.create_notification(follower.user.profilable_id, follower.user.profilable_type, "#{current_user.name} have asked you to setup the meeting for following topic #{params[:topic]}.", @meeting.class,{meeting_id: @meeting.id})
    end
    # @meeting_member = @meeting.meeting_members.build(memberable: @target_user).save
    redirect_to :back
  end


  def accept_request
    puts params
    if params[:status] == "1"
      @meeting_request = Notification.find(params[:notification_id]).meeting.update(acceptance_status: "accepted",accepted_by: current_user.id)
    else
      @meeting_request = Notification.find(params[:notification_id]).meeting.update(acceptance_status: "rejected",accepted_by: current_user.id)
    end
    redirect_to :back
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
