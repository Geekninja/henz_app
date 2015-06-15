class BillCategory < ActiveRecord::Base

  default_scope -> { where(status: true) }
  
  validates_presence_of :name
end
