class ReceiptsController < ApplicationController
  before_action :set_project
  before_action :set_receipt, only: [:edit, :update, :destroy]

  def index
    
    if params[:search].present?
      @begin_month  = Date.parse(params[:search][:start_date].to_s)
      @end_month    = Date.parse(params[:search][:end_date].to_s)
      
      @receipts = @project.receipts.where(deadline: @begin_month..@end_month)
    else
      @begin_month  = Date.today.beginning_of_month.strftime('%d/%m/%Y')
      @end_month    = Date.today.end_of_month.strftime('%d/%m/%Y')

      @receipts = @project.receipts.where(deadline: @begin_month..@end_month)
    end

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