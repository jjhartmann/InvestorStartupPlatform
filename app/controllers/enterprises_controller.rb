class EnterprisesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_enterprise, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @enterprises = @user.enterprises
  end

  def show
    unless @enterprise.questionaire.questions.present?
      redirect_to questionaries_path(enterprise: @enterprise.id)
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
        @enterprise_user = EnterpriseUser.create(enterprise_id: @enterprise.id, user_email: current_user.email, role_identifier: "member", member_title: "Founder")
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
    puts params
    params[:invitee].split(",").each do |invitee|
      puts invitee
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enterprise_params
      params.require(:enterprise).permit(:name, :pitch, :funds_to_raise, :industry, :enterprise_stage, :stage_identifier, :market_identifier, :location, :description, :logo, :followers_count, :followed_count, :comment_count)
      # params.fetch(:enterprise, {})
    end
end
