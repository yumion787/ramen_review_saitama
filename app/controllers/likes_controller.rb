class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    review = Review.find(params[:review_id])
    current_user.like(review)
    flash[:success] = 'いいね登録をしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    review = Review.find(params[:review_id])
    current_user.unlike(review)
    flash[:success] = 'いいねを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
