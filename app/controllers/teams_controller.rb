class TeamsController < ApplicationController
  before_action :admin_user?, only: [:index, :create, :destroy, :update]
  before_action :set_team, only:[:show, :destroy, :update]
  def index
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = 'チームを登録しました。'
      redirect_to '/teams'
    else
      flash.now[:danger] = 'チームの登録に失敗しました。'
      render :index
    end
  end
  
  def destroy
    unless @team
      render :index
    end
    @team.destroy
    flash[:success] = 'チームを削除しました。'
    redirect_back(fallback_location: teams_path)
  end
  
  def show
  end
  
  def update
    # @team = Team.new(team_params)
    # binding.pry
    if @team.update(team_params)
      flash[:success] = 'アイコンを登録しました。'
      redirect_to '/teams'
    else
      flash.now[:danger] = 'アイコンの登録に失敗しました。'
      render :index
    end
  end
  
  
  private
  def team_params
    params.require(:team).permit(:id, :name, :icon)
  end
  
  def set_team
    @team = Team.find(params[:id])
  end
  
  def admin_user?
    unless current_user.admin
      redirect_to root_url
    end
  end
end
