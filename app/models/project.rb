class Project < ActiveRecord::Base
  belongs_to :project_category
  belongs_to :responsible, class_name: 'Staff'

  has_many :bills
  has_many :quotations
  has_many :vehicles
  has_many :gas_stations
  has_many :fuel_expenses
  has_many :archives

  validates_presence_of :name, :local, :priority


  enum :priority => [:alta, :media, :baixa]
end
