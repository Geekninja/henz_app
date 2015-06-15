class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  # GET /quotations
  def index
    @quotations = Quotation.all
  end

  # GET /quotations/1
  def show
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  def create
    @quotation = Quotation.new(quotation_params)

    if @quotation.save
      redirect_to @quotation, notice: 'Quotation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quotations/1
  def update
    if @quotation.update(quotation_params)
      redirect_to @quotation, notice: 'Quotation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quotations/1
  def destroy
    @quotation.destroy
    redirect_to quotations_url, notice: 'Quotation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quotation_params
      params.require(:quotation).permit(:name, :description, :date, :project_id, :responsible_id, :status)
    end
end
