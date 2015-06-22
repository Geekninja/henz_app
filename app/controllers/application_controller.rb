class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_projects

  def set_projects
    @nav_projects = Project.all.order(:name)
  end

end
