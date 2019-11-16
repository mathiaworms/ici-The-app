class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?

  include UsersHelper
  include AdminsHelper
  include EventsHelper

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:age_range, :alias, :birthday, :is_alive, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:age_range, :alias, :birthday, :is_alive, :email, :current_password, :password, :password_confirmation)}
  end

end
