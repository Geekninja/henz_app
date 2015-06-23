class Supplier < ActiveRecord::Base

  belongs_to :project
  belongs_to :supplier_category

  scope :fuel, -> { joins(:supplier_category).where('supplier_categories.protected = ?', true)}
  enum :supplier_importance => [:alta, :normal, :baixa]

  validates_presence_of :name, :city, :state, :supplier_importance
end
