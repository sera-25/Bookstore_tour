class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  def search
    @q = Post.ransack(params[:q])
    @post = @q.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
  end
  
  def after_sign_in_path_for(resource)
    posts_path
  end
  
  private
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password])
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
