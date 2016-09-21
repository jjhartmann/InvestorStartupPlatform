class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # configured params now handled in the users/registreration_controller.rb
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_notifications, if: :user_signed_in?

  protected

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      session[:next] = request.fullpath
      puts session[:next]
      redirect_to login_url, :alert => "You have to log in to continue."
    else
      #render :file => "#{Rails.root}/public/403.html", :status => 403
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, :alert => exception.message
      else
        redirect_to main_app.root_url, :alert => exception.message
      end
    end
  end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :login, :photo]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def ensure_questionnaire_for_user
    unless current_user.profilable.questionaire
      redirect_to questionaries_path
    end
  end

  def get_notifications
    @notifications = current_user.profilable.notifications.where(is_viewed: false)
  end
end
