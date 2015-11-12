class Budget < ActiveRecord::Base
  belongs_to :quotation
  belongs_to :supplier

  has_many :budget_products
  
  accepts_nested_attributes_for :budget_products, allow_destroy: true

  validates :date, presence: true
end
