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
    @flag = true
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
        @question = current_user.profilable.questionaire.questions.new(question: q.question,answer: a)
        if @question.valid?
          @flag = true
        else
          @flag = false
        end
      end

      respond_to do |format|
        if @flag == true
          @questions.zip(params[:answers].to_a).each do |q,a|
            @question = current_user.profilable.questionaire.questions.create(question: q.question,answer: a)
          end

          if @user.profilable_type == "InvestorProfile"
            @answer = @user.profilable.questionaire.questions.find_by(question: "What startup type are you looking for?").answer
            @enterprises = Enterprise.where(stage_identifier: @answer)
            @enterprises.each do |enterprise|
              Notification.create_notification(enterprise.id, enterprise.class, "An Investor <a href='#'>#{@user.name}</a> is available for #{enterprise.name}. ")
              Notification.create_notification(@user.profilable_id, @user.profilable_type, "You might get interested in #{enterprise.name}")
            end
          end
          format.html {redirect_to user_dashboards_path, notice: "Great! now, please fll up your profile to let us help you more."}
          format.json
        else
          format.html {redirect_to questionaries_path, alert: "Please answer all the questions."}#{ render :layout => false }
          format.json
        end
      end

    else

      # Fetching questions for the enterprise
      @questions = QuestionsToAskEnterprise.all
      @enterprise = Enterprise.find(params[:enterprise])
      #Save the questions and the answers of the questionaire for the current user
      @questions.zip(params[:answers].to_a).each do |q,a|
        puts "______#{q.question}_________*#{a}_______"
        @question = @enterprise.questionaire.questions.new(question: q.question,answer: a)
        if @question.valid?
          @flag = true
        else
          @flag = false
        end
      end

      respond_to do |format|
        if @flag == true
          @questions.zip(params[:answers].to_a).each do |q,a|
            @question = @enterprise.questionaire.questions.create(question: q.question,answer: a)
          end

          @answer = @enterprise.stage_identifier
          @questions = Question.where("question = ? and answer = ?", "What startup type are you looking for?",@answer).pluck(:questionaire_id)
          @questionaire = Questionaire.where("id IN(?)", @questions)

          @questionaire.each do |questionaire|
            Notification.create_notification(questionaire.questionable_id, questionaire.questionable_type, "A new enterprise #{@enterprise.name} is created.")
          end

          format.html {redirect_to enterprises_path, notice: "Great! now, please fll up your profile to let us help you more."}
          format.json
        else
          format.html {redirect_to questionaries_path, alert: "Please answer all the questions."}#{ render :layout => false }
          format.json
        end
      end
    end
  end
end
