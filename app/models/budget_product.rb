class BudgetProduct < ActiveRecord::Base
  belongs_to :budget

  validates :product, :unit, :quantity, :unit_value, presence: true
end
