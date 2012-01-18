class AuthenticationsController < ApplicationController
  def create    
    auth = request.env['omniauth.auth']
    uuid = Digest::MD5.hexdigest(auth['uid'])
    provider = auth["provider"]
    
    authentication = Authentication.where({
      uuid: uuid,
      provider: provider
    }).first
    
    authentication ||= Authentication.create!({
      uuid: uuid,
      provider: provider,
      user_id: current_user.id
    })
    
    if name = request.env['omniauth.auth']["info"].try("name")
      current_user.update_attributes(name: name)
    end
    
    cookies.signed.permanent[:uuid] = authentication.user.uuid
    cookies.signed.permanent[:logged_in] = "true"
    
    flash[:notice] = "Authentication successful."
    redirect_to root_path
  end
    
  def failure
    redirect_to root_path, alert: "Oops, an error - #{params[:message]}"
  end
  
  def destroy
    cookies.delete(:uuid); cookies.delete(:logged_in)
    flash[:notice] = "Bye bye!"
    redirect_to root_path
  end
end
