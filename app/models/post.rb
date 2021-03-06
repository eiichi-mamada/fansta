class Post < ApplicationRecord
  belongs_to :user
  belongs_to :team
  
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  has_many :messages, dependent: :destroy

  validates :image, presence: true
  mount_uploader :image, ImageUploader

  def favorite(user)
    unless self.favorites.find_by(user_id: user.id).present?
      self.favorites.find_or_create_by(user_id: user.id)
    end
  end

  def unfavorite(user)
    favorite = self.favorites.find_by(user_id: user.id)
    favorite.destroy if favorite
  end

  def favorite?(user)
    self.users.include?(user)
  end
end
