class FuelExpense < ActiveRecord::Base
  belongs_to :project
  belongs_to :vehicle
  belongs_to :supplier

  validates_presence_of :vehicle, :km_start, :km_end, :date
  
  validates :fuel_price_lt, numericality: {only_float: true}, presence: true
  validates_numericality_of :km_start, :km_end
  
  validate :correct_km?
  private

  def correct_km?
    errors.add(:km_start, 'não pode ser maior que km fim') if km_start > km_end
  end
end
