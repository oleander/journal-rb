class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def current_user
    if uuid = cookies.signed[:uuid]
      user = User.find_by_uuid(uuid)
    end
    
    if not uuid or not user
      user = User.create!
      cookies.signed.permanent[:uuid] = user.uuid
    end
    
    return user
  end
end
