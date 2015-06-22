class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  # GET /suppliers
  def index
    @suppliers = @project.suppliers.all
  end

  # GET /suppliers/1
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = @project.suppliers.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  def create
    @supplier = @project.suppliers.new(supplier_params)

    if @supplier.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params)
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /suppliers/1
  def destroy
    if @supplier.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_params
      params.require(:supplier).permit(:name, :cnpj, :state_number, :supplier_importance, :city_number, :city, :state, :cep, :contact_name, :contact_telphone, :contact_email,:telphone, :telphone_optional, :email, :email_optional, :observations)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
