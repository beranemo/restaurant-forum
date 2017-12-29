# == Schema Information
#
# Table name: restaurants
#
#  id            :integer          not null, primary key
#  name          :string
#  tel           :string
#  address       :string
#  opening_hours :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  image         :string
#  category_id   :integer
#

class Restaurant < ApplicationRecord
  
  is_impressionable
  
  validates :name, presence: true
  # validates_presence_of :name
    
  mount_uploader :image, PhotoUploader
  
  belongs_to :category, optional: true # 允許外鍵 nil
  
  has_many :comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  
  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

end
