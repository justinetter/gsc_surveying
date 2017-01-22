class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.authenticate(params[:login], params[:password])
    if @user
      @user.update_token if @user.auth_token.nil? # stay logged in on multiple devices/browsers
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      cookies.permanent[:logged_in_before] = true
      redirect_to root_url
    else
      redirect_to :back, notice: "Invalid username, email, or password"
    end
  end
  
  def destroy
    if current_user
      current_user.update_token
      cookies.delete(:auth_token)
    end
    redirect_to root_url
  end
end
