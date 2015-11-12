class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  before_action :set_quotation

  # GET /budgets
  def index
    @budgets = @quotation.budgets
  end

  # GET /budgets/1
  def show
  end

  # GET /budgets/new
  def new
    @budget = @quotation.budgets.new
    @budget.budget_products.build
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  def create
    @budget = @quotation.budgets.new(budget_params)

    if @budget.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /budgets/1
  def update
    if @budget.update(budget_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /budgets/1
  def destroy
    @budget.destroy
    redirect_to action: 'index'
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_quotation
      @quotation = Quotation.find(params[:quotation_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def budget_params
      params.require(:budget).permit(:quotation_id, :supplier_id, :date, :status, budget_products_attributes: [:product, :unit, :quantity, :unit_value, :total_value, :id, :_destroy])
    end
end
