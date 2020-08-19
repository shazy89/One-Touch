class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    before_action :online_user

    private
    def current_user
        @user ||= User.find_by_id([session[:user_id]]) if logged_in?
    end

    def logged_in?
      !!session[:user_id]
    end

    def online_user
        redirect_to root_path unless logged_in? 
    end
end
