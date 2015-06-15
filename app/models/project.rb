class Project < ActiveRecord::Base
  belongs_to :project_category
  belongs_to :responsible, class_name: 'Staff'

  validates_presence_of :name, :local, :priority


  enum :priority => [:alta, :media, :baixa]
end
