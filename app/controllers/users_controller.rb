class UsersController < ApplicationController
  before_action :set_user

  def show
    @favorites = @user.favorites_posts.order(id: :desc).page(params[:page]).per(2)
    counts(@user)
  end
  
  def posts
  end
  
  def followings
    @followings = @user.followings.order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end

  def fan_teams
    @fan_teams = @user.teams.page(params[:page]).per(5)
    counts(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end