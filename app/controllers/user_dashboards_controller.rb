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
    @user = current_user
    # @all_users = User.where('profilable_type IS NOT ?', 'InvestorProfile')
    @all_users = User.where('profilable_type NOT IN(?)',['InvestorProfile']).where.not(id: current_user.id)
    @enterprises = Enterprise.all
  end

  def follow_unfollow_user
    if params[:target_type] == "Enterprise"
      @user = Enterprise.find(params[:target_id])
    else
      @user = User.find(params[:target_id])
    end
    if current_user.is_following?(@user)
      current_user.unfollow(@user)
    else
      current_user.follow(@user)
    end
    redirect_to root_path
  end

  def suggested_profile
    puts params
    @suggested_user = User.find(params[:profile_id])
  end

  def connections
    puts current_user.as_json
    puts current_user.target_followed.as_json
    @connections = current_user.target_followed
    @message = Message.new
  end
end
