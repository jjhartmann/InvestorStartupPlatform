class QuestionariesController < ApplicationController
  layout 'frontpage'
  before_filter :authenticate_user!
  
  def index
    @user_type = current_user.profilable_type
    if @user_type == "UserProfile"
      @questions = QuestionsToAskEntrepreneur.all.as_json
    elsif @user_type == "InvestorProfile"
      @questions = QuestionsToAskInvestor.all.as_json
    end
  end

  def save_questions
    puts params.inspect
    puts "******************"
    redirect_to root_path
  end
end
