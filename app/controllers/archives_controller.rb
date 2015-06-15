class ArchivesController < ApplicationController
  before_action :set_project
  before_action :set_archive, only: [:show, :edit, :update, :destroy]

  # GET /archives
  def index
    @archives = @project.archives.all
  end

  # GET /archives/1
  def show
  end

  # GET /archives/new
  def new
    @archive = @project.archives.new
  end

  # GET /archives/1/edit
  def edit
  end

  # POST /archives
  def create
    @archive = @project.archives.new(archive_params)

    if @archive.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /archives/1
  def update
    if @archive.update(archive_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /archives/1
  def destroy
    if @archive.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = @project.archives.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
    # Only allow a trusted parameter "white list" through.
    def archive_params
      params.require(:archive).permit(:project_id, :name, :description, :observation, :file_path)
    end
end
