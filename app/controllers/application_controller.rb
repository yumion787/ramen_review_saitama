class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private

    def require_user_logged_in
      unless logged_in?
        redirect_to login_url
      end
    end
    
    def counts(user)
      @count_stores = user.stores.count
      @count_favorites = user.favorites.count
      
      @count_reviews = user.reviews.count
      @count_likes = user.likes.count
    end
    
    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource)
      user_path(resource.id)
    end 
end
