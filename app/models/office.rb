class Office < ActiveRecord::Base
  belongs_to :responsible, class_name: 'Staff'
  belongs_to :project

  validates_presence_of :name, :city, :state, :telphone, :email
  validates :email, email: true
  validates :email_optional, email: true, allow_blank: true
  validates :telphone, numericality: true
  validates :telphone_optional, numericality: true, allow_blank: true
end
