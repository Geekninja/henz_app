class PaysController < ApplicationController
  before_action :set_project
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    params[:start_date] = Date.today.beginning_of_month.strftime('%d/%m/%Y') if !params[:start_date].present?
    params[:end_date] = Date.today.end_of_month.strftime('%d/%m/%Y') if !params[:end_date].present?

    @pays = @project.pays.filter(params[:start_date], params[:end_date])
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
                                   :date_payment, :note_payment, :observation_payment)
    end
    def set_project
      @project = Project.find(params[:project_id])
    end
end
