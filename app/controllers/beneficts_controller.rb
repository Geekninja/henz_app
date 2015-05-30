class BenefictsController < ApplicationController
  before_action :set_benefict, only: [:show, :edit, :update, :destroy]

  # GET /beneficts
  def index
    @beneficts = Benefict.all
  end

  # GET /beneficts/1
  def show
  end

  # GET /beneficts/new
  def new
    @benefict = Benefict.new
  end

  # GET /beneficts/1/edit
  def edit
  end

  # POST /beneficts
  def create
    @benefict = Benefict.new(benefict_params)

    if @benefict.save
      redirect_to @benefict, notice: 'Benefict was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /beneficts/1
  def update
    if @benefict.update(benefict_params)
      redirect_to @benefict, notice: 'Benefict was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /beneficts/1
  def destroy
    @benefict.destroy
    redirect_to beneficts_url, notice: 'Benefict was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefict
      @benefict = Benefict.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def benefict_params
      params.require(:benefict).permit(:name, :description, :default_value, :observation, :status)
    end
end
