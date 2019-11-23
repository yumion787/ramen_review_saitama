class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :stores
    
    has_many :favorites
    has_many :favstores, through: :favorites, source: :store
    
    def favorite(store)
      favorites.find_or_create_by(store_id: store.id)
    end
    
    def unfavorite(store)
     favorite = self.favorites.find_by(store_id: store.id)
     favorite.destroy if favorite
    end
    
    def favstore?(store)
     self.favstores.include?(store)
    end
    
    def fav_stores
     Store.where(user_id: self.favstore_ids + [self.id])
    end
end
