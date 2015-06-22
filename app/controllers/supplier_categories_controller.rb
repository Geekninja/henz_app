class SupplierCategoriesController < ApplicationController
  before_action :set_supplier_category, only: [:edit, :update, :destroy]
  def index
    @supplier_categories = SupplierCategory.all
  end

  def new
    @supplier_category = SupplierCategory.new
  end

  def edit
  end

  def create
    @supplier_category = SupplierCategory.new(set_params)

    if @supplier_category.save
      flash[:success] = t :sucess
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def update
    if @supplier_category.update(set_params)
      flash[:success] = t :sucess
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end
  
  def destroy
    if @supplier_category.destroy
      flash[:success] = t :sucess
      redirect_to action: 'index'
    end
  end

  private

  def set_supplier_category
    @supplier_category = SupplierCategory.find(params[:id])
  end

  def set_params
    params.require(:supplier_category).permit(:name, :status)
  end
end