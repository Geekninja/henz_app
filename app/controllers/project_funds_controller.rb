class ProjectFundsController < ApplicationController
  before_action :set_project_fund, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  # GET /project_funds
  def index
    @project_funds = @project.project_funds
  end

  # GET /project_funds/1
  def show
  end

  # GET /project_funds/new
  def new
    @project_fund = @project.project_funds.new
  end

  # GET /project_funds/1/edit
  def edit
  end

  # POST /project_funds
  def create
    @project_fund = @project.project_funds.new(project_fund_params)

    if @project_fund.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /project_funds/1
  def update
    if @project_fund.update(project_fund_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /project_funds/1
  def destroy
    @project_fund.destroy
    redirect_to action: 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_fund
      @project_fund = ProjectFund.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_fund_params
      params.require(:project_fund).permit(:project_id, :value, :date, :date_payment, :supplier_id, :note_payment, :name, :description, :observations, :status)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
