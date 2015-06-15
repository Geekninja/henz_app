class Sector < ActiveRecord::Base
  belongs_to :responsible, class_name: 'Staff'

  default_scope -> { where(status: true)}
  validates_presence_of :name, :acron
end
