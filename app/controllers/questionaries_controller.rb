class QuestionariesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  respond_to  :html

  def index
    if current_user.profilable.questionaire.questions.present?
      redirect_to root_path
    else
      @user_type = current_user.profilable_type
      if @user_type == "UserProfile"
        @questions = QuestionsToAskEntrepreneur.all.as_json
      elsif @user_type == "InvestorProfile"
        @questions = QuestionsToAskInvestor.all.as_json
      end
    end
  end

  def save_questions
    @params =  params["questionaires"]
    puts @params.class
    @params.each do |question|
      current_user.profilable.questionaire.questions.create(question: @params[question]["question"],answer: @params[question]["answer"])
    end
    respond_to do |format|
      format.html #{ render :layout => false }
      format.json
    end
  end
end
