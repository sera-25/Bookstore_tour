class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  private
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password])
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
