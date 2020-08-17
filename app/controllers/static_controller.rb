class StaticController < ApplicationController
  skip_before_action :online_user, only: [:welcome]
  def welcome
    @user = current_user
    @products = Product.all
  end
end
