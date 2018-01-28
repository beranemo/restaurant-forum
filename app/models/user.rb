# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  role                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  intro                  :text
#  avatar                 :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :comments
  has_many :restaurants, through: :comments
  
  mount_uploader :avatar, AvatarUploader
  
  # 使用者有很多收藏的餐廳的多對多關聯
  has_many :favorites, dependent: :destroy # 當 User 物件被刪件，相關的 Favorite 物件會一併刪除
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
  
  # 使用者有很多喜翻的餐廳的多對多關聯
  has_many :likes, dependent: :destroy # 當 User 物件被刪件，相關的 Favorite 物件會一併刪除
  has_many :liked_restaurants, through: :likes, source: :restaurant
  
  # 使用者有很多追蹝記錄，也有很多他自己正在追蹤的人
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  
  # 使用者有很多追蹤自己的人
  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user
  
  # 交友邀請相關功能
  has_many :friendships
  has_many :friends, through: :friendships
  
  # 對我發出好友邀請的人
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :want2yous, through: :inverse_friendships, source: :user
  
  
  before_save :initialize_name
  
  def admin?
    self.role == 'admin'
  end
  
  def following?(user)
    self.followings.include?(user)
  end
  
  def friend?(user)
    self.friends.include?(user)
  end
  
  def initialize_name
    if self.name == '' || self.name == nil
      self.name = self.email.split('@').first
    end
  end
  
end
