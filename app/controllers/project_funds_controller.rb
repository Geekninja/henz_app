class ProjectFundsController < ApplicationController
  before_action :set_project_fund, only: [:show, :edit, :update, :destroy]

  # GET /project_funds
  def index
    @project_funds = ProjectFund.all
  end

  # GET /project_funds/1
  def show
  end

  # GET /project_funds/new
  def new
    @project_fund = ProjectFund.new
  end

  # GET /project_funds/1/edit
  def edit
  end

  # POST /project_funds
  def create
    @project_fund = ProjectFund.new(project_fund_params)

    if @project_fund.save
      redirect_to @project_fund, notice: 'Project fund was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /project_funds/1
  def update
    if @project_fund.update(project_fund_params)
      redirect_to @project_fund, notice: 'Project fund was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /project_funds/1
  def destroy
    @project_fund.destroy
    redirect_to project_funds_url, notice: 'Project fund was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_fund
      @project_fund = ProjectFund.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_fund_params
      params.require(:project_fund).permit(:project_id, :value, :date, :month, :year, :title, :description, :observations, :status)
    end
end
