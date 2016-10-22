class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy, :download]

  layout 'frontpage'
  before_filter :authenticate_user!

  # GET /proposals
  # GET /proposals.json
  def index
    if @user.profilable_type == "InvestorProfile"
      @proposals = Proposal.get_proposals(@user).paginate(page: params[:page], per_page: 2)
    else
      @proposals =  Proposal.where("enterprise_id IN(?)", @user.enterprises.ids).paginate(page: params[:page], per_page: 2)
    end
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    if @user.profilable_type == "InvestorProfile"
      respond_to do |format|
        format.html { redirect_to root_path, alert: "You cannot create a proposal."}
      end
    else
      @enterprises = @user.enterprises
      @proposal = Proposal.new
    end
  end

  # GET /proposals/1/edit
  def edit
    @enterprises = @user.enterprises
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new
    @enterprises = @user.enterprises
    @enterprise = Enterprise.find_by(id: params[:proposal][:enterprise_id])
    respond_to do |format|
      if @enterprise.nil?
        @proposal.errors.add(:enterprise_id, :blank, message: "cannot be blank")
        format.html { render :new }
      elsif @enterprise.proposals.count >= Settings.enterprise.proposal.limit
        @proposal.errors.add(:enterprise_id, :blank, message: "This enterprise is already in use. Please use a different one.")
        format.html { render :new }
      else
        @proposal = @enterprise.proposals.new(proposal_params)
        if @proposal.save
          format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
          format.json { render :show, status: :created, location: @proposal }
        else
          format.html { render :new }
          format.json { render json: @proposal.errors, status: :unprocessable_entity }
        end
      end
    end
    # @enterprises = @user.enterprises
    # @proposal = Proposal.new(proposal_params)
    # respond_to do |format|
    #   if @proposal.save
    #     format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
    #     format.json { render :show, status: :created, location: @proposal }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @proposal.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to proposals_url, notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    #This will decrpyt the file first

    Carrierwave::EncrypterDecrypter::Downloader.decrypt(@proposal,mounted_as: :document)

    file_path = @proposal.document.path
      File.open(file_path, 'r') do |f|
        send_data f.read, type: MIME::Types.type_for(file_path).first.content_type,disposition: :inline,:filename => File.basename(file_path)
    end
      #This is to remove the decrypted file after transfer
      File.unlink(file_path)
  end

  def view_proposal
    @proposals = Proposal.get_proposals(@user)
    @proposal = @proposals.find_by(id: params[:proposal_id])
    if @proposal.present?
      @proposal
    else
      respond_to do |format|
        format.html { redirect_to proposals_path, alert: "You cannot access this proposal." }
      end
    end
  end

  private

    def set_proposal
      if @user.profilable_type == "InvestorProfile"
        @enterprises = @user.enterprises_followed
        @proposals = Proposal.get_proposals(@user)
      else
        @enterprises = @user.enterprises
        @proposals = Proposal.get_users_proposals(@user)
      end
      if @proposals.present?
        @proposal = @proposals.find_by(id: params[:id])
        if @proposal.nil?
          respond_to do |format|
            format.html{ redirect_to proposals_path, alert: "You cannot access this proposal."}
          end
        else
          @proposal
        end
      else
        respond_to do |format|
          format.html{ redirect_to proposals_path, alert: "You cannot access this proposal."}
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      # params.require(:proposal).permit!
      # params.fetch(:proposal, {})
      params.require(:proposal).permit(:proposal_stage_identifier, :new_business_model, :new_product, :pitch, :introduction, :one_year_target_audience, :one_year_per_capita_annual_spending, :one_year_number_of_users, :one_year_penetration_rate, :one_year_marketing_strategy, :one_year_gross_profit_margin, :five_year_target_audience, :five_year_per_capita_annual_spending, :five_year_number_of_users, :five_year_market_cap, :five_year_penetration_rate, :five_year_marketing_strategy, :five_year_gross_profit_margin, :competitors_details, :competitive_edges, :competing_strategy, :investment_amount, :investment_currency, :equity_percentage, :spending_plan, :next_investment_round, :document, :enterprise_id)
    end
end
