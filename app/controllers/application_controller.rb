class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def check_if_logged_in
  	if session[:user_id]
  		return true
  	else
  		redirect_to '/login', notice: "Log in first please!"
  		return false
  	end
  end

end
