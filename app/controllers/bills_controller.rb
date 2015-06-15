class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  def index
    @bills = Bill.all
  end

  # GET /bills/1
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      redirect_to @bill, notice: 'Bill was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      redirect_to @bill, notice: 'Bill was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy
    redirect_to bills_url, notice: 'Bill was successfully destroyed.'
  end

  private
    def set_bill
      @bill = Bill.find(params[:id])
    end

    def bill_params
      params.require(:bill).permit(:bill_type, :bill_category_id, :project_id, :name, :description, :status, :value, :supplier_id, :observation)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
