class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @products = @user.products
  end
end
