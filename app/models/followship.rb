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
end
