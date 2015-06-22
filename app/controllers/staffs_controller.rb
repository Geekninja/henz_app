class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  # GET /staffs
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      flash[:success] = t :success
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /staffs/1
  def update
    if @staff.update(staff_params)
      flash[:success] = t :success
      redirect_to action: 'index'    
    else
      render :edit
    end
  end

  # DELETE /staffs/1
  def destroy
    if @staff.destroy
      flash[:success] = t :success
      redirect_to action: 'index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def staff_params
      params.require(:staff).permit(:name, :code, :cpf, :job_function, :job_id, :status, :sector_id, :city, :state, :address, :telphone, :telphone_optional, :celphone, :project_id, :office_id, :office_support_id, :born, :salary)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end
