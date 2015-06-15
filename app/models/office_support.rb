class OfficeSupport < ActiveRecord::Base
  belongs_to :responsible, class_name: 'Staff'
  belongs_to :project
  belongs_to :office

  validates_presence_of :name, :office_id, :city, :state, :telphone
  validates :email, email: true, allow_blank: true
end
