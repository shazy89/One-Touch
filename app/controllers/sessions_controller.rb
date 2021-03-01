class SessionsController < ApplicationController
  skip_before_action :online_user, only: [:new, :create, :github]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(user_params[:username])
    if @user && !logged_in? && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Username or password didnt match"
      redirect_to new_session_path
    end
  end

  def github
    user = User.find_or_create_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def auth
    request.env["omniauth.auth"]
  end
end
