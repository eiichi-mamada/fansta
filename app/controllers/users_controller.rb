class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites.page(params[:page])
    counts(@user)
  end
  
  def user_posts
    @user = User.find(params[:id])
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end

  def fan_teams
    @user = User.find(params[:id])
    @fan_teams = @user.fan_teams.page(params[:page])
    counts(@user)
  end

end