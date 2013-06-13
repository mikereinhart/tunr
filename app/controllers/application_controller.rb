class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
  	if session[:user_id]
  		User.find(session[:user_id])
  		#alternative: User.find_by_id(Session[:user_id])
  	end

  end
end