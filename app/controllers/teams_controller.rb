class TeamsController < ApplicationController
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

  def team_params
    params.require(:team).permit(:id, :name)
  end
end
