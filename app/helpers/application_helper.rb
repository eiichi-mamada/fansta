module ApplicationHelper
  
  def team_index
    @teams = Team.all.order(:id)
  end
  
  def display_image(model_url)
    model_url.present? ? model_url : asset_path("no_image.png")
  end
  
end
