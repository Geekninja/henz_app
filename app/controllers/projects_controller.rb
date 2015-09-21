class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    params[:start_date] = Date.today.beginning_of_month.strftime('%d/%m/%Y') if !params[:start_date].present?
    params[:end_date] = Date.today.end_of_month.strftime('%d/%m/%Y') if !params[:end_date].present?

    @project_funds   = @project.project_funds.where(created_at: Date.parse(params[:start_date])..Date.parse(params[:end_date]))
    @project_finance = @project.project_finances.where(created_at: Date.parse(params[:start_date])..Date.parse(params[:end_date]))
    @pays            = @project.pays.where(status: false)
    @receipts        = @project.receipts.where(status: false)
    @fuels           = @project.fuel_expenses.where(status: true)
    @uploads         = @project.archives
            
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(set_params)

    if @project.save
      redirect_to action: 'index'
      flash[:success] = t :success
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(set_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    if @project.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def set_params
      params.require(:project).permit(:project_category_id, :name, :local, :responsible_id, :geolocation, :description, :observation, :priority)
    end
end
