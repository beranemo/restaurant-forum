# == Schema Information
#
# Table name: favorites
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Favorite < ApplicationRecord
  
  # 收藏記錄：它屬於使用者，也屬於餐廳
  belongs_to :user
  belongs_to :restaurant
  
end
