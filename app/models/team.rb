class Team < ApplicationRecord
  
  validates :id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  has_many :posts
  mount_uploader :icon, ImageUploader
end
