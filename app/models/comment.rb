class Comment < ApplicationRecord
  belongs_to :store
  
  mount_uploader :image, ImageUploader
  
  default_scope -> { order(created_at: :desc) }
end
