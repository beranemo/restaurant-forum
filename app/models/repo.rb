# == Schema Information
#
# Table name: repos
#
#  id          :integer          not null, primary key
#  site_name   :string
#  site_url    :string
#  github_name :string
#  github_url  :string
#  account     :string
#  password    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sort        :integer
#

class Repo < ApplicationRecord
  
  before_save :initialize_github_name
  
  def initialize_github_name
    if self.github_name == nil || self.github_name == ""
      self.github_name = self.github_url.split("://github.com/").last
    end
  end
    
end
