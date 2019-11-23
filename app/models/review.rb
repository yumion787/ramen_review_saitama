class Review < ApplicationRecord
  belongs_to :user
  
  # menu文字数は、１文字〜50文字まで
  validates :menu, presence: true, length: { maximum: 50 }
  
  # comment文字数は、50文字まで
  # validates :comment, length: { maximum: 50 }
  
end
