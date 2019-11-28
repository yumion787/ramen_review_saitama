class FavoritesController < ApplicationController
   before_action :require_user_logged_in
  
  def create
    store = Store.find(params[:favorite_id])
    current_user.favorite(store)
    flash[:success] = 'お気に入り登録をしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    store = Store.find(params[:favorite_id])
    current_user.unfavorite(store)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_back(fallback_location: root_path)
  end

end
