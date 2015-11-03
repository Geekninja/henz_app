class StaffPaysController < ApplicationController
  before_action :set_project

  def index
    @staff_pays = Pay.where(staff_id: current_user.id)
  end
  
  private
  
  def set_project
    @project = Project.find(params[:project_id])
  end

end
