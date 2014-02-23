class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to(session[:return_to] || root_url)
    session[:return_to] = nil
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end