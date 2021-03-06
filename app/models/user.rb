class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts, dependent: :destroy

  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow

  has_many :favorites, dependent: :destroy
  has_many :favorites_posts, through: :favorites, source: :post

  has_many :fan_teams, dependent: :destroy
  has_many :teams, through: :fan_teams

  has_many :messages, dependent: :destroy

  mount_uploader :icon, ImageUploader

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end