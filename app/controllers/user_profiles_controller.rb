class UserProfilesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_user_profile, only: [:index, :update, :destroy, :show, :edit] if :connection_profile
  before_action :user, only: [:index, :show, :edit]

  def index
  end

  def show
    @message = Message.new
    if params[:connection_profile].present?
      @user_profile = User.find(params[:connection_profile])
      Notification.create_notification(@user_profile.profilable_id, @user.profilable_type, "#{@user.name} viewed #{@user_profile.name}'s profile.")
    elsif params[:suggested_profile].present?
      @user_profile = User.find(params[:suggested_profile])
      Notification.create_notification(@user_profile.profilable_id, @user.profilable_type, "#{@user.name} viewed #{@user_profile.name}'s profile.")
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user_profile.profilable.update(profilable_params)
        format.html { redirect_to @user_profile, notice: 'User Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def meeting_request
    puts "******************"
    puts params.inspect
    puts "******************"
    @meeting = Meeting.create(topic: params[:topic],start_time: Time.now, end_time: Time.now+1.hour, user_id: current_user.id)
    @meeting_member = @meeting.meeting_members.build(memberable: User.find(params[:requested_client_id])).save
    redirect_to :back
  end

  private

  def set_user_profile
    if params[:id].to_i == current_user.id
      @user_profile = User.find(params[:id])
    else
      # @user_profile = User.find(60)
      redirect_to root_path
      # redirect_to(url_for(:back))
      # redirect_back(fallback_location: request.referer)
    end
  end
  def connection_profile
    return params[:connection_profile].nil? || params[:suggested_profile]
  end

  def user
    @user = current_user
  end

  def profilable_params
    params.require(:user_profile).permit(:tagline)
  end
end
