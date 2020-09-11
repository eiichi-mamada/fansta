class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :favorites
  has_many :favorites_posts, through: :favorites, source: :post

  has_many :fan_teams, dependent: :destroy
  has_many :teams, through: :fan_teams

  mount_uploader :icon, ImageUploader

end
