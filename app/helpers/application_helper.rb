module ApplicationHelper
  
  def team_index
    @teams = Team.all
  end
  
  
end
