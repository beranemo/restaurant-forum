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

require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
