class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_projects
  before_action :project_context

  def set_projects
    @nav_projects = Project.all.order(:name)
  end

  def project_context
    if params[:project_id].present? || controller_name == "projects" && action_name == "show"
      @project_context = true 
    else
      @project_context = false
    end
  end
end
