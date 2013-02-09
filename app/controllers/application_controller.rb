class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller?
  skip_authorization_check :if => :hv_controller?

  def hv_controller?
    is_a?(HighVoltage::PagesController)
  end
end
