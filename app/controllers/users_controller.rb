class UsersController < ApplicationController
  def new
    unless current_user
      @user = User.new
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      cookies.permanent[:logged_in_before] = true
      redirect_to root_url
    else
      redirect_to :back
    end
  end
end
