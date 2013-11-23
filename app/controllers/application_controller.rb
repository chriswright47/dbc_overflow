class ApplicationController < ActionController::Base
  protect_from_forgery

  def signed_in?
    !session[:user_id].nil?
  end

  def current_user
  	if signed_in?
	    current_user ||= User.find(session[:user_id])
	  else
	  	nil
	  end
  end

end
