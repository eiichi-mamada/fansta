class FanTeamsController < ApplicationController
  before_action :authenticate_user!
  def create
    team = Team.find(params[:team_id])
    team.fan(current_user)
    flash[:success] = 'Fanteamに登録しました。'
    redirect_to team
  end

  def destroy
    team = Team.find(params[:team_id])
    team.unfan(current_user)
    flash[:success] = 'Fanteam登録を解除しました。'
    redirect_to team
  end
end
