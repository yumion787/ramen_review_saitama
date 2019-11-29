class StoresController < ApplicationController
  # begore_action :require_user_logged_in, only:[:new, :edit, :destroy]
  before_action :correct_user, only: [:destroy]
  
  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
    # @store = current_user.stores.build  # form_with 用
    # @stores = current_user.stores.order(id: :desc).page(params[:page])
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = Store.find(params[:id])
    # @stores = @user.stores.order(id: :desc).page(params[:page])
    # counts(@store)
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
    
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = current_user.stores.build(store_params)
    
    if @store.save
        flash[:success] = '店舗情報を投稿しました。'
        redirect_to root_url
    else
        @stores = current_user.stores.order(id: :desc).page(params[:page])
        flash.now[:danger] = '店舗情報の投稿に失敗しました。'
        render 'toppages/index'
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    flash[:success] = '店舗情報を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :address, :infomation, :image)
    end
    
    def correct_user
      @store = current_user.stores.find_by(id: params[:id])
      unless @store
        redirect_to root_url
      end
    end
end
