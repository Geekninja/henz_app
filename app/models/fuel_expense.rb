class FuelExpense < ActiveRecord::Base
  belongs_to :project
  belongs_to :vehicle
  belongs_to :gas_station

  validates_presence_of :vehicle, :gas_station, :km_start, :km_end, :fuel_price_lt, :date
  validates_numericality_of :km_start, :km_end
end
