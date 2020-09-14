class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites_posts.order(id: :desc).page(params[:page]).per(2)
    counts(@user)
  end
  
  def posts
    @user = User.find(params[:id])
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end

  def fan_teams
    @user = User.find(params[:id])
    @fan_teams = @user.teams.page(params[:page]).per(5)
    counts(@user)
  end

end