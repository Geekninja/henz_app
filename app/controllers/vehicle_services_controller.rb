class VehicleServicesController < ApplicationController
  before_action :set_vehicle_service, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_services
  def index
    @vehicle_services = VehicleService.all
  end

  # GET /vehicle_services/1
  def show
  end

  # GET /vehicle_services/new
  def new
    @vehicle_service = VehicleService.new
  end

  # GET /vehicle_services/1/edit
  def edit
  end

  # POST /vehicle_services
  def create
    @vehicle_service = VehicleService.new(vehicle_service_params)

    if @vehicle_service.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /vehicle_services/1
  def update
    if @vehicle_service.update(vehicle_service_params)
      flash[:success] = t :success
      redirect_to action: 'index'
     else
      render :edit
    end
  end

  # DELETE /vehicle_services/1
  def destroy
    if @vehicle_service.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_service
      @vehicle_service = VehicleService.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vehicle_service_params
      params.require(:vehicle_service).permit(:name, :status)
    end
end
