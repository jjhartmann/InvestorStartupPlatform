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
    @network_count = current_user.network_counts(current_user.target_followed.pluck(:target_id),current_user)
    @connection_count = current_user.connection_counts(current_user.target_followed.pluck(:target_id),current_user)
    respond_to do |format|
      format.js
    end
  end

  def suggested_profile
    @suggested_user = User.find(params[:profile_id])
  end

  def connections
    @connections = current_user.target_followed.where(target_type: "User")
    puts @connections.pluck(:target_id)
    @connection_id_array = []
    @connections.pluck(:target_id).each do |target_id|
      if User.find(target_id).is_following?(current_user)
        puts User.find(target_id).is_following?(current_user)
        @connection_id_array << target_id
      end
    end
    @connected_users = User.where(id: @connection_id_array)

    @message = Message.new
  end

  def network
    @followers = @user.followers
  end

end
