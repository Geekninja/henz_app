class BudgetProductsController < ApplicationController
  before_action :set_budget_product, only: [:show, :edit, :update, :destroy]

  # GET /budget_products
  def index
    @budget_products = BudgetProduct.all
  end

  # GET /budget_products/1
  def show
  end

  # GET /budget_products/new
  def new
    @budget_product = BudgetProduct.new
  end

  # GET /budget_products/1/edit
  def edit
  end

  # POST /budget_products
  def create
    @budget_product = BudgetProduct.new(budget_product_params)

    if @budget_product.save
      redirect_to @budget_product, notice: 'Budget product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_products/1
  def update
    if @budget_product.update(budget_product_params)
      redirect_to @budget_product, notice: 'Budget product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_products/1
  def destroy
    @budget_product.destroy
    redirect_to budget_products_url, notice: 'Budget product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_product
      @budget_product = BudgetProduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def budget_product_params
      params.require(:budget_product).permit(:budget_id, :name, :quantity, :value, :observation)
    end
end
