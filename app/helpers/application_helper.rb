module ApplicationHelper

  def signed_in?
    !session[:user_id].nil?
  end

  def current_user
  	if signed_in?
	    User.find(session[:user_id])
	  else
	  	nil
	  end
  end

end
