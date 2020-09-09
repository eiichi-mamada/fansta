class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def user_posts
    @user = User.find(params[:id])
  end
  
end