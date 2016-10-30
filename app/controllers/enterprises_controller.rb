class EnterprisesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_enterprise, only: [:edit, :update, :destroy, :show]

  def index
    # Heading for title setions
    @title_heading = "Companies"

    @user = current_user
    if @user.profilable_type == "InvestorProfile"
      @enterprises = @user.enterprises_followed.paginate(page: params[:page], per_page: 10)

      @overlay_partial = render_to_string(partial: "enterprises/meeting_schedule_popover", layout: false, locals: {id: "id-99858", name: "name-996854"})
      @overlay_partial.remove!("\n")
      @overlay_partial.tr! '"', "'"
    else
      @enterprise_network = @user.enterprises_followed.paginate(page: params[:page], per_page: 10)
      @enterprises = @user.enterprises.paginate(page: params[:page], per_page: 10)
      @requests = @user.invitations.where(acceptance_status: "requested")
    end
  end

  def show
    @enterprise = Enterprise.find_by(id: params[:id])

    if @enterprise.nil?
      respond_to do |format|
        format.html{ redirect_to enterprises_path, alert: "No such enterprise exists." }
      end
    else
      unless @enterprise.questionaire.questions.present?
        redirect_to questionaries_path(enterprise: @enterprise.id)
      end
      if params[:enterprise].present?
        @enterprise = Enterprise.find_by(id: params[:enterprise])
        if @enterprise.nil?
          respond_to do |format|
            format.html{ redirect_to enterprises_path, alert: "No such enterprise exists." }
          end
        end
      end
    end


  end

  def new
    @enterprise = Enterprise.new
  end

  def edit
  end

  def create
    @enterprise = Enterprise.new(enterprise_params)
    respond_to do |format|
      if @enterprise.save
        current_user.follow(@enterprise)
        @enterprise_user = @enterprise.enterprise_users.create(user_email: current_user.email, role_identifier: "member", member_title: "Founder")
        @enterprise.create_questionaire
        format.html { redirect_to enterprise_path(@enterprise.id), notice: 'Enterprise was successfully created.' }
        format.json { render :index, status: :created, location: @enterprise }
      else
        format.html { render :new }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @enterprise.update(enterprise_params)
        send_notifications = @enterprise.send_notification
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully updated.' }
        format.json { render :show, status: :ok, location: @enterprise }
      else
        format.html { render :edit }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @enterprise.destroy
    respond_to do |format|
      format.html { redirect_to enterprises_url, notice: 'Enterprise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_member
    params[:invitee].split(",").each do |invitee|
      @user = User.find_by(email: invitee)
      if @user.present?
        @invitation = Invitation.create(enterprise_id: params[:enterprise_id],user_id: @user.id, email: @user.email)
        InvitationMailer.invitation_mail(@invitation).deliver_now
      else
        @invitation = Invitation.create(enterprise_id: params[:enterprise_id], email: invitee)
        InvitationMailer.invitation_mail(@invitation).deliver_now
      end
    end
    redirect_to root_path
  end

  def public_profile
    @enterprise = Enterprise.find_by(id: params[:enterprise])
    if @enterprise.questionaire != nil && @enterprise.questionaire.questions != nil && @enterprise.questionaire.questions.present?
      if current_user.add_visitor(@enterprise)
        @notification = Notification.create_notification(@enterprise.id, "Enterprise", "#{@user.name} viewed #{@enterprise.name}'s profile.","Enterprise")
      end
    else
      respond_to do |format|
        format.html { redirect_to enterprises_path, alert: "This enterprise is not available right now." }
      end
    end

    @people = @enterprise.members
  end

  def invitation_status
    @invitation = Invitation.find(params[:id])
    if params[:status] == "1"
      @invitation.update(acceptance_status: "accepted")
      EnterpriseUser.create(enterprise_id: @invitation.enterprise_id, user_email: @invitation.email, role_identifier: "member", member_title: "Founder")
    else
      @invitation.update(acceptance_status: "rejected")
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enterprise
      @enterprises = @user.enterprises
      if @enterprises.nil?
        respond_to do |format|
          format.html { redirect_to enterprises_path, alert: "You don't have any enterprises yet." }
        end
      else
        @enterprise = @enterprises.find_by(id: params[:id])
        if @enterprise.present?
          return @enterprise
        else
          respond_to do |format|
            format.html { redirect_to enterprises_path, alert: "You don't have access to this enterprise." }
          end
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enterprise_params
      params.require(:enterprise).permit(:name, :pitch, :funds_to_raise, :industry, :enterprise_stage, :stage_identifier, :market_identifier, :location, :description, :logo, :followers_count, :followed_count, :comment_count)
      # params.fetch(:enterprise, {})
    end
end
