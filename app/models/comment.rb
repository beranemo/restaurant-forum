class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :restaurant
  
  validates_presence_of :content # 加入這行就可以比較 save! 與 save 不同處
end
