class ProjectFinancesController < ApplicationController
  before_action :set_project

  def index
    @project_base.project_finances.all
  end

  def new
    @project_finance = @project_base.project_finances.new
  end

  private

  def set_project
    @project_base = Project.find(params[:project_id])
  end
end
