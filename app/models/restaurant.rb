class Restaurant < ApplicationRecord
  validates :name, presence: true
 # validates_presence_of :name
  
  mount_uploader :image, PhotoUploader
  
end
