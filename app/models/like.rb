class Like < ApplicationRecord
  
  # 喜翻：使用者喜翻餐廳，餐廳被使用者喜翻
  belongs_to :user
  belongs_to :restaurant
  
end
