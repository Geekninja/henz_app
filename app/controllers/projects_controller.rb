class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
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
