class QuestionariesController < ApplicationController
  layout 'frontpage'
  before_action :authenticate_user!
  respond_to  :html

  def index
    if params[:enterprise].present?
      @questions =QuestionsToAskEnterprise.all.as_json
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
    puts @params.class
      unless params[:enterprise].present?
        @params.each do |question|
          if current_user.profilable.questionaire.questions.create!(question: @params[question]["question"],answer: @params[question]["answer"])
            puts "Done"
          else
            puts "not done"
          end
        end
        respond_to do |format|
          format.html #{ render :layout => false }
          format.json
        end
      else
        @enterprise = Enterprise.find(params[:enterprise])
        @params.each do |question|
          @enterprise.questionaire.questions.create(question: @params[question]["question"],answer: @params[question]["answer"])
        end
        respond_to do |format|
          format.html { redirect_to enterprise_path(@enterprise.id) }
          format.json
        end
      end

  end

end
