class QuestionariesController < ApplicationController
  layout 'frontpage'
  def index
    puts current_user.profilable_type
    @user_type = current_user.profilable_type
    if @user_type == "UserProfile"
      @questions = QuestionsToAskEntrepreneur.all
      puts "____________"
    elsif @user_type == "InvestorProfile"
      @questions = QuestionsToAskInvestor.all
      puts "**************"
    end
    puts @questions.as_json
  end

  def save_questions
    puts params.inspect
    puts "******************"
    redirect_to root_path
  end
end
