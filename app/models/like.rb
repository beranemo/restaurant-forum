# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Like < ApplicationRecord
  
  # 喜翻：使用者喜翻餐廳，餐廳被使用者喜翻
  belongs_to :user
  belongs_to :restaurant
  
end
