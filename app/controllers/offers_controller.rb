class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  layout 'frontpage'
  before_filter :authenticate_user!

  # GET /offers
  # GET /offers.json
  def index
    if @user.profilable_type == "InvestorProfile"
      @offers = current_user.offers
    else
      @proposals = Proposal.get_users_proposals(@user)
      @offers = Offer.where("proposal_id IN(?)",@proposals.ids)
      puts @offers.as_json
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    if @user.profilable_type == "UserProfile"
      respond_to do |format|
        format.html { redirect_to offers_path, alert: "You cannot create or edit an offer."}
      end
    else
      @offer = current_user.offers.new()
      @proposals = Proposal.get_proposals(@user)
    end
  end

  # GET /offers/1/edit
  def edit
      @proposals = Proposal.get_proposals(@user)
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = current_user.offers.new(offer_params)
    @proposals = Proposal.get_proposals(@user)
    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offers = @user.offers
      if @offers.present?
        @offer = @offers.find_by(id: params[:id])
        if @offer.nil?
          respond_to do |format|
            format.html{ redirect_to offers_path, alert: "You cannot access this offer."}
          end
        else
          @offer
        end
      else
        respond_to do |format|
          format.html{ redirect_to offers_path, alert: "You cannot access this offer."}
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:offer_title, :text, :description, :amount_to_offer, :proposal_id)
    end

end
