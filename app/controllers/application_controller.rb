class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :browser, :mobile?

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  def mobile?
    browser.device.mobile? or browser.device.tablet?
  end
  
  def browser
    Browser.new("Some User Agent", accept_language: "en-us")
  end
end
