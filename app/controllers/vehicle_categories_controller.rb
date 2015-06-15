class VehicleCategoriesController < ApplicationController
  before_action :set_vehicle_category, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_categories
  def index
    @vehicle_categories = VehicleCategory.all
  end

  # GET /vehicle_categories/1
  def show
  end

  # GET /vehicle_categories/new
  def new
    @vehicle_category = VehicleCategory.new
  end

  # GET /vehicle_categories/1/edit
  def edit
  end

  # POST /vehicle_categories
  def create
    @vehicle_category = VehicleCategory.new(vehicle_category_params)

    if @vehicle_category.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /vehicle_categories/1
  def update
    if @vehicle_category.update(vehicle_category_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /vehicle_categories/1
  def destroy
    if @vehicle_category.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_category
      @vehicle_category = VehicleCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vehicle_category_params
      params.require(:vehicle_category).permit(:name, :status)
    end
end
