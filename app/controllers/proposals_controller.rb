class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:show, :edit, :update, :destroy, :download]

  layout 'frontpage'
  before_filter :authenticate_user!

  # GET /proposals
  # GET /proposals.json
  def index
    if @user.profilable_type == "InvestorProfile"
      @proposals = Proposal.get_proposals(@user)
    else
      @proposals =  Proposal.where("enterprise_id IN(?)", @user.enterprises.ids)
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
    @enterprises = @user.enterprises
    @proposal = Proposal.new(proposal_params)
    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
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
    puts @proposals.as_json
    @proposal = @proposals.find_by(id: params[:proposal_id])
    puts @proposal.as_json
    if @proposal.present?
      @proposal
    else
      respond_to do |format|
        format.html { redirect_to proposals_path, alert: "You cannot access this proposal." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposals = @user.proposals
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
