class BillCategoriesController < ApplicationController
  before_action :set_bill_category, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  # GET /bill_categories
  def index
    @bill_categories = BillCategory.unscoped.all
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
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /bill_categories/1
  def update
    if @bill_category.update(bill_category_params)
     flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /bill_categories/1
  def destroy
    if @bill_category.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_category
      @bill_category = BillCategory.unscoped.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
    # Only allow a trusted parameter "white list" through.
    def bill_category_params
      params.require(:bill_category).permit(:name, :status)
    end
end
