class PaysController < ApplicationController
  before_action :set_project
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @begin_month  = Date.parse(params[:search][:start_date].to_s)
      @end_month    = Date.parse(params[:search][:end_date].to_s)
      
      @pays = @project.pays.where(deadline: @begin_month..@end_month)
    else
      @begin_month  = Date.today.beginning_of_month
      @end_month    = Date.today.end_of_month

      @pays = @project.pays.where(deadline: @begin_month..@end_month)
    end
  end

  # GET /bills/1
  def show
  end

  # GET /bills/new
  def new
    @pay = @project.pays.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  def create
    @pay = @project.pays.new(pay_params)

    if @pay.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @pay.update(pay_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /bills/1
  def destroy
    if @pay.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    def set_bill
      @pay =  @project.pays.find(params[:id])
    end

    def pay_params
      params.require(:pay).permit( :deadline, :bill_category_id, 
                                   :project_id, :name, :description,
                                   :status, :value, :supplier_id, :observation, :archive,
                                   :date_payment, :note_payment, :observation_payment,
                                   privilege_id: [])
    end
    def set_project
      @project = Project.find(params[:project_id])
    end
end
