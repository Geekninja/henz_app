class Project < ActiveRecord::Base
  belongs_to :project_category
  belongs_to :responsible, class_name: 'User'

  validates_presence_of :name, :local, :priority
end
