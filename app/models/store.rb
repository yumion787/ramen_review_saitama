class Store < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  
  # name文字数は、１文字〜30文字まで
  validates :name, presence: true, length: { maximum: 30 }
  
  # address文字数は、50文字まで
  validates :address, length: { maximum: 50 }
  
end
