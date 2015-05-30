class ProjectCategory < ActiveRecord::Base
  validates :name, presence: true
end
