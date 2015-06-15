class OfficeSupportsController < ApplicationController
  before_action :set_office_support, only: [:show, :edit, :update, :destroy]

  # GET /office_supports
  def index
    @office_supports = OfficeSupport.all
  end

  # GET /office_supports/1
  def show
  end

  # GET /office_supports/new
  def new
    @office_support = OfficeSupport.new
  end

  # GET /office_supports/1/edit
  def edit
  end

  # POST /office_supports
  def create
    @office_support = OfficeSupport.new(office_support_params)

    if @office_support.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /office_supports/1
  def update
    if @office_support.update(office_support_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /office_supports/1
  def destroy
    if @office_support.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_support
      @office_support = OfficeSupport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def office_support_params
      params.require(:office_support).permit(:name, :local, :responsible_id, :geolocation, :observation, :project_id, :office_id, :telphone, :telphone_optional, :city, :state, :email)
    end
end
