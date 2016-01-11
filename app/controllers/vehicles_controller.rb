class VehiclesController < ApplicationController
  before_action :set_project
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = @project.vehicles.all
  end

  # GET /vehicles/1
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = @project.vehicles.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  def create
    @vehicle = @project.vehicles.new(vehicle_params)

    if @vehicle.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /vehicles/1
  def destroy
    if @vehicle.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle =  @project.vehicles.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
    # Only allow a trusted parameter "white list" through.
    def vehicle_params
      params.require(:vehicle).permit(:project_id, :name, :board, :description, :vehicle_service_id, :vehicle_type, :vehicle_category_id, :observations, :acquired, :state, :fuel)
    end
end
