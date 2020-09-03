module ApplicationHelper
  
  def team_index
    @teams = Team.all.order(:id)
  end
  
end
