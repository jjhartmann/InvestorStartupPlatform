class UserDashboardsController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!

  def index

    if @user_type == "InvestorProfile"
      @company_matches = Notification.where(is_viewed: false, notificable_id: @user.profilable_id, notification_type: "CompanyMatch").sample(3)

      # If the user profile has not been filled out, redirect to edit
      if (!session[:fill_details] &&
          (!current_user.profilable.tagline? ||
              !current_user.profilable.funds_to_offer? ||
              !current_user.profilable.description? ||
              !current_user.location? ||
              !current_user.introduction?))
        session[:fill_details] = true
        flash[:update_profile] = "Please update your profile!"
        redirect_to edit_user_registration_path
      elsif !current_user.profilable.questionaire.questions.present?
        redirect_to questionaries_path
      end
    elsif @user_type == "UserProfile"
      # If the user profile has not been filled out, redirect to edit
      if (!session[:fill_details] &&
          (!current_user.profilable.profession? ||
              !current_user.profilable.skills? ||
              !current_user.profilable.industry? ||
              !current_user.profilable.something_cool? ||
              !current_user.location? ||
              !current_user.introduction?))
        session[:fill_details] = true
        flash[:update_profile] = "Please update your profile!"
        redirect_to edit_user_registration_path
      elsif !current_user.profilable.questionaire.questions.present?
        redirect_to questionaries_path
      end
     end

    @feeds = NewsFeed.all.paginate(page: params[:page], per_page: 3)

    # Once per session, search for matches
    # get matches for investors
    if !session[:search_match]
      if @user_type == "InvestorProfile"
        @answer = @user.profilable.questionaire.questions.find_by(question: "What startup type are you looking for?").answer
        @enterprises = Enterprise.where(stage_identifier: @answer).sample(3)
        @enterprises.each do |enterprise|
          Notification.create_notification(enterprise.id, enterprise.class, "An Investor <a href='#'>#{@user.name}</a> is available for #{enterprise.name}. ", "InvestorMatch")
          Notification.create_notification(@user.profilable_id, @user.profilable_type, "You might be interested in #{enterprise.name}", "CompanyMatch", {company_id_type: enterprise.id})
        end
      end

      session[:search_match] = true
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
    @title_heading = "Search"

    @search = nil

    case params[:type]
      when "Investors"
        if params[:search] != nil
          @search = User.investors.public_only.where("deleted_at IS ? AND name LIKE (?)", nil, "%#{params[:search]}%").where.not(id: current_user.id).paginate(page: params[:page], per_page: 10)
        else
          @search = User.investors.public_only.where(deleted_at: nil).where.not(id: current_user.id).paginate(page: params[:page], per_page: 10)
        end
      when "Companies"
        if params[:search] != nil
          @search = Enterprise.where("name LIKE (?)", "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
        else
          @search = Enterprise.all.paginate(page: params[:page], per_page: 10)
        end
      else
        params[:type] = "Users"

        if params[:search] != nil
          @search = User.startups.public_only.where("deleted_at IS ? AND name LIKE (?)", nil, "%#{params[:search]}%").where.not(id: current_user.id).paginate(page: params[:page], per_page: 10)
        else
          @search = User.startups.public_only.where(deleted_at: nil).where.not(id: current_user.id).paginate(page: params[:page], per_page: 10)
        end
    end
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
    @network_count = current_user.followers.count
    @connection_count = current_user.connection_counts(current_user.target_followed.where(target_type: "User").pluck(:target_id), current_user)

    @connections = current_user.target_followed.where(target_type: "User")
    @connection_id_array = []
    @connections.pluck(:target_id).each do |target_id|
      if User.find(target_id).is_following?(current_user)
        @connection_id_array << target_id
      end
    end
    @connected_users = User.where(id: @connection_id_array)
    puts "______________________"
    puts @network_count
    puts @connection_count
    puts "______________________"
    respond_to do |format|
      format.js
    end
    # redirect_back(fallback_location: request.referer)
  end

  def suggested_profile
    @suggested_user = User.find(params[:profile_id])
  end

  def connections
    @title_heading = "Connections"
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
    @featured_users = StartupFeature.all.paginate(page: params[:page], per_page: 3)
  end

  def searched_users
    # @all_users = User.where('profilable_type IS NOT ?', 'InvestorProfile')
    @all_investors = User.where('name LIKE ? AND profilable_type NOT IN(?) AND deleted_at = ?', "%#{params[:name]}%", [current_user.profilable_type], nil).where.not(id: current_user.id)
    @all_users = User.where('name LIKE ? AND profilable_type = ? AND deleted_at = ?', "%#{params[:name]}%", [current_user.profilable_type], nil).where.not(id: current_user.id)
    @enterprises = Enterprise.where('name LIKE ?', "%#{params[:name]}%")
    respond_to do |format|
      format.js
    end
  end

  def update_profile
    @user.update_attribute(:is_public, params[:user][:is_public])
    redirect_to root_path, notice: "Profile successfully updated"
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
