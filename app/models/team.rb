class Team < ApplicationRecord
  
  validates :id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
end
