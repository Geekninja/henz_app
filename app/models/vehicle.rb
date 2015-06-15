class Vehicle < ActiveRecord::Base
  belongs_to :project
  belongs_to :vehicle_service
  belongs_to :vehicle_category

  enum :vehicle_type => [:alugado, :comprado]
  validates_presence_of :name, :vehicle_service, :vehicle_type, :vehicle_category
  validates_date :acquired, allow_blank: true
end
