class FuelExpensesController < ApplicationController
  before_action :set_project
  before_action :set_fuel_expense, only: [:show, :edit, :update, :destroy]

  # GET /fuel_expenses
  def index
    
    if params[:search].present?
      @begin_month  = Date.parse(params[:search][:start_date].to_s)
      @end_month    = Date.parse(params[:search][:end_date].to_s)
      
      @fuel_expenses = @project.fuel_expenses.where(date: @begin_month..@end_month)
    else
      @begin_month  = Date.today.beginning_of_month.strftime('%d/%m/%Y')
      @end_month    = Date.today.end_of_month.strftime('%d/%m/%Y')

      @fuel_expenses = @project.fuel_expenses.where(date: @begin_month..@end_month)
    end    
  end

  # GET /fuel_expenses/1
  def show
  end

  # GET /fuel_expenses/new
  def new
    @fuel_expense = @project.fuel_expenses.new
  end

  # GET /fuel_expenses/1/edit
  def edit
  end

  # POST /fuel_expenses
  def create
    @fuel_expense = @project.fuel_expenses.new(fuel_expense_params)

    if @fuel_expense.save
      flash[:success] = t :success
      redirect_to action: 'index'

    else
      render :new
    end
  end

  # PATCH/PUT /fuel_expenses/1
  def update
    if @fuel_expense.update(fuel_expense_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /fuel_expenses/1
  def destroy
    if @fuel_expense.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuel_expense
      @fuel_expense = @project.fuel_expenses.find(params[:id])
    end

    def set_project
     @project = Project.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def fuel_expense_params
      params.require(:fuel_expense).permit(:project_id, :supplier_id, :note, :vehicle_id, :gas_station_id, :km_start, :km_end, :fuel_price_lt, :fuel_lt, :date, :status, :observations)
    end
end
