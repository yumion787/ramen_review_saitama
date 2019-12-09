class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @stores = Store.all
    @comments = Comment.all.page(params[:page]).per(5)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    # @comment = store.comments.build(comment_params)
   
    @comment = Comment.new(comment_params)

    # if @comment.save
    #     flash[:success] = 'レビューを投稿しました。'
    #     redirect_to comments_path
    # else
    #     @comments = current_user.comments.order(id: :desc).page(params[:page])
    #     flash.now[:danger] = 'レビューの投稿に失敗しました。'
    #     render '/comments'
    # end
    
    # respond_to do |format|
      if @comment.save
        # format.html { redirect_to @comment, notice: 'レビューを投稿しました。' }
        # format.json { render :show, status: :created, location: @comment }
        flash[:success] = 'レビューを投稿しました。'
        redirect_to comments_path
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        # @comments = current_user.comments.order(id: :desc).page(params[:page])
        # flash.now[:danger] = 'レビューの投稿に失敗しました。'
        # render '/comments'
      end
    # end
    
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
        flash[:success] = 'レビューを修正しました。'
        redirect_to comments_path(@comment)
    else
        render 'edit'
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:menu, :body, :store_id, :image)
    end
    
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      unless @comment
        redirect_to root_url
      end
    end
end
