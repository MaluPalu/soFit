class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:  [:name, :username, :picture,
       :target_weight, :target_bmi, :current_weight, :current_bmi])
    devise_parameter_sanitizer.permit(:account_update, keys:  [:name, :username, :picture,
       :target_weight, :target_bmi, :current_weight, :current_bmi])
  end

  protected
  def after_sign_in_path_for(resource)
    user_categories_path(current_user)
  end
end
