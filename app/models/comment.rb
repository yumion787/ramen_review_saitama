class Comment < ApplicationRecord
  belongs_to :store
  
  default_scope -> { order(created_at: :desc) }
end
