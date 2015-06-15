class SectorsController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :update, :destroy]

  # GET /sectors
  def index
    @sectors = Sector.unscoped.all
  end

  # GET /sectors/1
  def show
  end

  # GET /sectors/new
  def new
    @sector = Sector.new
  end

  # GET /sectors/1/edit
  def edit
  end

  # POST /sectors
  def create
    @sector = Sector.new(sector_params)

    if @sector.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /sectors/1
  def update
    if @sector.update(sector_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /sectors/1
  def destroy
    if @sector.destroy
      flash[:success] = t :success
      redirect_to action: 'index'  
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.unscoped.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sector_params
      params.require(:sector).permit(:name, :description, :acron, :responsible_id, :status)
    end
end
