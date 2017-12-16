class Restaurant < ApplicationRecord
  validates :name, presence: true
  # validates_presence_of :name
    
  mount_uploader :image, PhotoUploader
  
  belongs_to :category, optional: true # 允許外鍵 nil
  
end
