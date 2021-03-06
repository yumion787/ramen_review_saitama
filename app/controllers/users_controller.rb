class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :favorites]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  # マイページ
  def show
    @user = User.find(params[:id])
    @stores = current_user.stores.order(id: :desc).page(params[:page]).per(10)
    @favorites = @user.favstores.page(params[:page])
    
    # @stores = @user.stores.order(id: :desc).page(params[:page])
    # @favorites = @user.favstores.order(id: :desc).page(params[:page])
    # counts(@user)
    
    # @comment = Comment.find(params[:id])
    # @comments = @store.comments.order(id: :desc).page(params[:page]).per(10)
    # @comments = @store.comments.all
    # @comments = @store.comments.order(id: :desc).page(params[:page])
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
        flash[:success] = 'ユーザを登録しました。'
        redirect_to @user
    else
        flash.now[:danger] = 'ユーザの登録に失敗しました。'
        render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favstores.page(params[:page])
    counts(@user)
  end
  
  # def likes
  #   @user = User.find(params[:id])
  #   @likes = @user.like_reviews.page(params[:page])
  #   counts(@user)
  # end

  private
  
    # Use callbacks to share common setup or constraints between actions.
  def set_user
      @user = User.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
