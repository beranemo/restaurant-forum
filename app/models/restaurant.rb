# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  name            :string
#  tel             :string
#  address         :string
#  opening_hours   :string
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  image           :string
#  category_id     :integer
#  favorites_count :integer          default(0)
#

class Restaurant < ApplicationRecord
  
  is_impressionable
  
  validates :name, presence: true
  # validates_presence_of :name
    
  mount_uploader :image, PhotoUploader
  
  belongs_to :category, optional: true # 允許外鍵 nil
  
  has_many :comments, dependent: :destroy
  
  # 餐廳有很多使用者來收藏它
  has_many :favorites, dependent: :destroy # :destroy 當 User 物件被刪除時，相關的 Favorite 物件會一併被刪除
  has_many :favorited_users, through: :favorites, source: :user
   
  # 餐廳有很多使用者喜翻
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  
  default_scope { order(created_at: :desc) }
  
  def is_favorited?(user)
    self.favorited_users.include?(user)
  end
  
  def is_liked?(user)
    self.liked_users.include?(user)
  end
  
  def count_favorites
    self.favorites_count = self.favorites.size
    self.save
  end
    
end
