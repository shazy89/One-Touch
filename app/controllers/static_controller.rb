class StaticController < ApplicationController
  def welcome
    @user = current_user
  end
end
