class PstsController < ApplicationController
  before_action :set_pst, only: [:show, :edit, :update, :destroy]

  # GET /psts
  # GET /psts.json
  def index
    @psts = Pst.all
  end

  # GET /psts/1
  # GET /psts/1.json
  def show
  end

  # GET /psts/new
  def new
    @pst = Pst.new
  end

  # GET /psts/1/edit
  def edit
  end

  # POST /psts
  # POST /psts.json
  def create
    @pst = Pst.new(pst_params)

    respond_to do |format|
      if @pst.save
        format.html { redirect_to @pst, notice: 'Pst was successfully created.' }
        format.json { render :show, status: :created, location: @pst }
      else
        format.html { render :new }
        format.json { render json: @pst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /psts/1
  # PATCH/PUT /psts/1.json
  def update
    respond_to do |format|
      if @pst.update(pst_params)
        format.html { redirect_to @pst, notice: 'Pst was successfully updated.' }
        format.json { render :show, status: :ok, location: @pst }
      else
        format.html { render :edit }
        format.json { render json: @pst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psts/1
  # DELETE /psts/1.json
  def destroy
    @pst.destroy
    respond_to do |format|
      format.html { redirect_to psts_url, notice: 'Pst was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pst
      @pst = Pst.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pst_params
      params.require(:pst).permit(:image)
    end
end
