class StaffFundsController < ApplicationController
  before_action :set_project
  has_scope :by_period, :using => [:started_at, :ended_at], :type => :hash

  def index
    @staff_funds  = apply_scopes(ProjectFinance).where(staff_id: current_user.id)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
