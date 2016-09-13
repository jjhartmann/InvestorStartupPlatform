class Users::SessionsController < Devise::SessionsController
  layout "frontpage"
  before_action :configure_sign_in_params
  skip_before_action :verify_authenticity_token
  respond_to :json, :html


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    # sign_in_and_redirect(resource)
    # respond_with resource, :location => after_sign_in_path_for(resource)
    # puts params.inspect
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute,:login])
  end
end
