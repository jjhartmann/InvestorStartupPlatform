class UserDashboardsController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!

  def index
    if current_user.profilable.questionaire.questions.present?
      @feeds = NewsFeed.all.paginate(page: params[:page], per_page: 2)
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

  def update_password
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
  end

  def all_users
    # @all_users = User.where('profilable_type IS NOT ?', 'InvestorProfile')
<<<<<<< HEAD
    # @all_users = User.where(profilable_type: current_user.profilable_type).where.not(id: current_user.id)
    # @all_investors = User.where('profilable_type NOT IN(?)',[current_user.profilable_type]).where.not(id: current_user.id)
    @all_users = User.where(profilable_type: "UserProfile").where.not(id: current_user.id).paginate(page: params[:page], per_page: 2)
    @all_investors = User.where(profilable_type: "InvestorProfile").where.not(id: current_user.id).paginate(page: params[:page], per_page: 2)
    @enterprises = Enterprise.all.paginate(page: params[:page], per_page: 2)
=======
    @all_users = User.where(profilable_type: "UserProfile").where.not(id: current_user.id)
    @all_investors = User.where(profilable_type: "InvestorProfile").where.not(id: current_user.id)
    @enterprises = Enterprise.all
>>>>>>> b05b12586936ec25ee3c64d235a630e744d91c86
  end

  def follow_unfollow_user
    puts "________"
    if params[:target_type] == "Enterprise"
      @user = Enterprise.find(params[:target_id])
    else
      @user = User.find(params[:target_id])
    end
    puts "@@@@@@@"
    if current_user.is_following?(@user)
      current_user.unfollow(@user)
    else
      current_user.follow(@user)
    end
    @network_count = current_user.network_counts(current_user.target_followed.where(target_type: "User").pluck(:target_id),current_user)
    @connection_count = current_user.connection_counts(current_user.target_followed.where(target_type: "User").pluck(:target_id),current_user)

    @connections = current_user.target_followed.where(target_type: "User")
    @connection_id_array = []
    @connections.pluck(:target_id).each do |target_id|
      if User.find(target_id).is_following?(current_user)
        @connection_id_array << target_id
      end
    end
    @connected_users = User.where(id: @connection_id_array)
    respond_to do |format|
      format.js
    end
  end

  def suggested_profile
    @suggested_user = User.find(params[:profile_id])
  end

  def connections
    @connections = current_user.target_followed.where(target_type: "User")
    @connection_id_array = []
    @connections.pluck(:target_id).each do |target_id|
      if User.find(target_id).is_following?(current_user)
        @connection_id_array << target_id
      end
    end
    @connected_users = User.where(id: @connection_id_array).paginate(page: params[:page], per_page: 2)
    @message = Message.new
  end

  def profile_visitors
    @visitors = @user.visitee.paginate(page: params[:page], per_page: 2)
  end

  def featured_users
    @featured_users = StartupFeature.all
  end

  def searched_users
    # @all_users = User.where('profilable_type IS NOT ?', 'InvestorProfile')
    @all_investors = User.where('name LIKE ? AND profilable_type NOT IN(?)',"%#{params[:name]}%",[current_user.profilable_type]).where.not(id: current_user.id)
    @all_users = User.where('name LIKE ? AND profilable_type = ?',"%#{params[:name]}%",[current_user.profilable_type]).where.not(id: current_user.id)
    @enterprises = Enterprise.where('name LIKE ?', "%#{params[:name]}%")
    respond_to do |format|
      format.js
    end
  end

  def update_profile
    @user.profilable.update_attribute("is_public", params[:user_profile][:is_public])
    redirect_to root_path, notice: "Profile successfully updated"
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
