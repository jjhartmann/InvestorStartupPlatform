class UserProfilesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  before_action :set_user_profile,only: [:index, :update, :destroy, :show]

  def index
    @current_user = current_user
    puts @current_user.as_json
    puts @user_profile
  end

  def show
    puts request.referer
    puts "________________"
    puts @user_profile.as_json
    # puts request.original_url
  end

  def update
  end

  def destroy
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
end