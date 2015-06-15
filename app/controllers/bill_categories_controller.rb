class BillCategoriesController < ApplicationController
  before_action :set_bill_category, only: [:show, :edit, :update, :destroy]

  # GET /bill_categories
  def index
    @bill_categories = BillCategory.all
  end

  # GET /bill_categories/1
  def show
  end

  # GET /bill_categories/new
  def new
    @bill_category = BillCategory.new
  end

  # GET /bill_categories/1/edit
  def edit
  end

  # POST /bill_categories
  def create
    @bill_category = BillCategory.new(bill_category_params)

    if @bill_category.save
      redirect_to @bill_category, notice: 'Bill category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bill_categories/1
  def update
    if @bill_category.update(bill_category_params)
      redirect_to @bill_category, notice: 'Bill category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bill_categories/1
  def destroy
    @bill_category.destroy
    redirect_to bill_categories_url, notice: 'Bill category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_category
      @bill_category = BillCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_category_params
      params.require(:bill_category).permit(:name, :status)
    end
end
