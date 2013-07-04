# Manages the application.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization unless: :devise_controller?
  skip_authorization_check if: :hv_controller?

  #Determines if page controller is a HighVoltage controller.
  #
  #@return [Boolean] whether or not the pages controller is a
  #HighVoltage controller
  def hv_controller?
    is_a?(HighVoltage::PagesController)
  end

  #Redirect for the sign-up page.
  #
  #@return [String] the HTML/JSON for the edit profile page
  def after_sign_up_path_for(resource)
    if resource_or_scope.is_a?(User)
      edit_profile_path current_user.username
    end
  end

  #Redirect for signing in.
  #
  #@return [String] the HTML/JSON for the edit profile page
  def after_sign_in_path_for(resource)
    if current_user.sign_in_count == 1 && resource.is_a?(User)
      edit_profile_path current_user.username
    else
      super
    end
  end

  #Redirect for access denied error.
  #
  #@return nil
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end
end
