class ProjectFinancesController < ApplicationController
  before_action :set_project

  def index
    @project_finances = @project_base.project_finances.all
  end

  def new
    @project_finance = @project_base.project_finances.new
  end

  def create
    @project_finance = @project_base.project_finances.new(project_finance_params)
    
    if @project_finance.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end


  private

  def project_finance_params
    params.require(:project_finance).permit(:finance_type, :value, :status, :title, :description, :quantity, :month, :year, :date, :project_id)
  end

  def set_project
    @project_base = Project.find(params[:project_id])
  end
end
