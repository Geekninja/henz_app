class GasStationsController < ApplicationController
  before_action :set_project
  before_action :set_gas_station, only: [:show, :edit, :update, :destroy]

  # GET /gas_stations
  def index
    @gas_stations = @project.gas_stations.all
  end

  # GET /gas_stations/1
  def show
  end

  # GET /gas_stations/new
  def new
    @gas_station = @project.gas_stations.new
  end

  # GET /gas_stations/1/edit
  def edit
  end

  # POST /gas_stations
  def create
    @gas_station = @project.gas_stations.new(gas_station_params)

    if @gas_station.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /gas_stations/1
  def update
    if @gas_station.update(gas_station_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /gas_stations/1
  def destroy
    if @gas_station.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gas_station
      @gas_station = @project.gas_stations.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gas_station_params
      params.require(:gas_station).permit(:name, :location, :city, :state, :geolocation, :observation)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
