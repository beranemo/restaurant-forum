# == Schema Information
#
# Table name: followships
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  following_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Followship < ApplicationRecord
  belongs_to :user
  belongs_to :following, class_name: "User"
  
  validates :following_id, uniqueness: { scope: :user_id }  
  # validates :user_id, uniqueness: { scope: :following_id }
  
end
