class Team < ApplicationRecord
  
  validates :id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  has_many :posts, dependent: :destroy
  has_many :fan_teams, dependent: :destroy
  has_many :users, through: :fan_teams

  mount_uploader :icon, ImageUploader
  
  def fan(user)
    unless self.fan_teams.find_by(user_id: user.id).present?
      self.fan_teams.find_or_create_by(user_id: user.id)
    end
  end

  def unfan(user)
    fan_team = self.fan_teams.find_by(user_id: user.id)
    fan_team.destroy if fan_team
  end

  def fan_team?(user)
    self.users.include?(user)
  end
end
