class UserDashboardsController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!

  def index
    if current_user.profilable.questionaire.questions.present?
      @feeds = NewsFeed.all.limit(5)
    else
      redirect_to questionaries_path
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  def all_users
    # @all_users = User.where('profilable_type IS NOT ?', 'InvestorProfile')
    @all_users = User.where('profilable_type NOT IN(?)',['InvestorProfile'])
  end

  def follow_unfollow_user
    puts params
    @user = User.find(params[:target_id])
    puts @user.id
    puts @user.profilable_type
    current_user.follow(@user)
    redirect_to root_path
  end
end
