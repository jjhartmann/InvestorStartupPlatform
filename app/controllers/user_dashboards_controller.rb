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
end
