class ReviewsController < ApplicationController
  # before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = current_user.reviews.build(review_params)
    
    if @review.save
        flash[:success] = 'レビューを投稿しました。'
        redirect_to root_url
    else
        @reviews = current_user.reviews.order(id: :desc).page(params[:page])
        flash.now[:danger] = 'レビューの投稿に失敗しました。'
        render '/reviews'
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])
    # respond_to do |format|
    
    if @review.update(review_params)
        flash[:success] = '店舗情報を修正しました。'
        redirect_to reviews_path(@review)
    else
        render 'edit'
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:menu, :comment, :image)
    end
    
    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      unless @review
        redirect_to root_url
      end
    end
end
