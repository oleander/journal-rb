class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?
  
  def current_user
    if uuid = cookies.signed[:uuid]
      user = User.find_by_uuid(uuid)
    end
    
    unless user
      user = User.create!
      cookies.signed.permanent[:uuid] = user.uuid
    end
    
    return user
  end
  
  def logged_in?
    cookies.signed[:logged_in] == "true"
  end
end
