class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller?
  skip_authorization_check :if => :hv_controller?

  def hv_controller?
    is_a?(HighVoltage::PagesController)
  end

  def after_sign_up_path_for(resource)
    edit_profile_path current_user.username
  end

  def after_sign_in_path_for(resource)
   if current_user.sign_in_count == 1
      edit_profile_path current_user.username
    end
  end
end
