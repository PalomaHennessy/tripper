class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_js
  	@goog_js = ENV['GOOGLE_JS']
  end

  def current_user
  	@current_user ||=User.find_by_id(session[:user_id])
  end
end
