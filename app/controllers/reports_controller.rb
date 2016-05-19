class ReportsController < ApplicationController
  before_action :set_project

  def staffs
  end

  def suppliers
  end

  def finance
  end

  def vehicles
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end