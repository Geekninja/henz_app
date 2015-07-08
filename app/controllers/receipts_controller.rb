class ReceiptsController < ApplicationController
  before_action :set_project
  before_action :set_receipt, only: [:edit, :update, :destroy]

  def index
    @receipts = Receipt.all
  end

  def new
    @receipt = @project.receipts.new
  end

  def create
    @receipt = @project.receipts.new(set_receipt_params)

    if @receipt.save
      flash[:success] =  t :success
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @receipt.update(set_receipt_params)
      flash[:success] =  t :success
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def destroy
    if @receipt.destroy
      flash[:success] =  t :success
      redirect_to action: 'index'
    end
  end

  private

  def set_receipt_params
    params.require(:receipt).permit(:name, :description, :value, :deadline, 
                                    :archive, :date_paymnet, :observation_receipt,
                                    :bill_category_id, :status )
  end

  def set_receipt
    @receipt = @project.receipts.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end