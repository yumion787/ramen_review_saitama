class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store
  # belongs_to :comment
end
