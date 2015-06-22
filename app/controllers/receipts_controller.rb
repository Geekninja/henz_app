class ReceiptsController < ApplicationController
  before_action :set_project
  
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_receipts_params
  end

  def set_receipts
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end