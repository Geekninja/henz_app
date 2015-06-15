class Quotation < ActiveRecord::Base
  belongs_to :project
  belongs_to :responsible, class_name: "Staff"

  validates_presence_of :name, :date
end
