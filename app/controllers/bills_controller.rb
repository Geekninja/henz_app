class BillsController < ApplicationController
  before_action :set_project
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    @bills = @project.bills
  end

  # GET /bills/1
  def show
  end

  # GET /bills/new
  def new
    @bill = @project.bills.new
    @bill.bill_products.build
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  def create
    @bill = @project.bills.new(bill_params)

    if @bill.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /bills/1
  def destroy
    if @bill.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    def set_bill
      @bill =  @project.bills.find(params[:id])
    end

    def bill_params
      params.require(:bill).permit(:bill_type, :deadline, :bill_category_id, 
                                   :project_id, :name, :description,
                                   :status, :value, :supplier_id, :observation,
                                   :bill_products_attributes => [:type_product, :title, :description, :quantity, :value, :id, :_destroy])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
