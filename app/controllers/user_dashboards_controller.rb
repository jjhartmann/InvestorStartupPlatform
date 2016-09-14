class UserDashboardsController < ApplicationController
  layout 'frontpage'
  before_filter :authenticate_user!

  def index
    unless current_user.profilable.questionaire.questions.present?
      redirect_to questionaries_path
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def upadte
  end

  def show
  end

  def destroy
  end
end
