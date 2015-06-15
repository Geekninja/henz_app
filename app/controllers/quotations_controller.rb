class QuotationsController < ApplicationController
  before_action :set_project
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  # GET /quotations
  def index
    @quotations = @project.quotations.all
  end

  # GET /quotations/1
  def show
  end

  # GET /quotations/new
  def new
    @quotation = @project.quotations.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  def create
    @quotation = @project.quotations.new(quotation_params)

    if @quotation.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /quotations/1
  def update
    if @quotation.update(quotation_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /quotations/1
  def destroy
    if @quotation.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = @project.quotations.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def quotation_params
      params.require(:quotation).permit(:name, :description, :date, :project_id, :responsible_id, :status)
    end
end
