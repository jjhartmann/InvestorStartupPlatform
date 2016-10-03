class QuestionariesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  respond_to :html

  def index
    if params[:enterprise].present?
      @questions = QuestionsToAskEnterprise.all.as_json
      @enterprise = Enterprise.find(params[:enterprise])
      if @enterprise.questionaire.questions.present?
        redirect_to enterprise_path(params[:enterprise])
      end
    else
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
  end

  def save_questions
    @params =  params["questionaires"]
    puts params.inspect
    puts params[:enterprise]
    @hash_array = []
    puts params[:answers].to_a
    unless params[:enterprise].present?

      # Fetching questions according to profile type of the user
      if current_user.profilable_type == "UserProfile"
        @questions = QuestionsToAskEntrepreneur.all
      else
        @questions = QuestionsToAskInvestor.all
      end

      #Save the questions and the answers of the questionaire for the current user
      @questions.zip(params[:answers].to_a).each do |q,a|
        current_user.profilable.questionaire.questions.create!(question: q.question,answer: a)
      end
      respond_to do |format|
        format.html {redirect_to root_path}#{ render :layout => false }
        format.json
      end
    else

      # Fetching questions for the enterprise
      @questions = QuestionsToAskEnterprise.all
      @enterprise = Enterprise.find(params[:enterprise])
      #Save the questions and the answers of the questionaire for the current user
      @questions.zip(params[:answers].to_a).each do |q,a|
        puts "______#{q.question}_________*#{a}_______"
        @enterprise.questionaire.questions.create(question: q.question,answer: a)
      end
      respond_to do |format|
        format.html { redirect_to enterprise_path(@enterprise.id) }
        format.json
      end
    end
  end
end
