class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :comments
  has_many :restaurants, through: :comments
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :favorites, dependent: :destroy 
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  
  def admin?
    self.role == 'admin'
  end
end
