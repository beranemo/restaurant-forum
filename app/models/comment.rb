# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  content       :text
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :restaurant
  
  validates_presence_of :content # 加入這行就可以比較 save! 與 save 不同處
end
