class Supplier < ActiveRecord::Base

  belongs_to :project
  belongs_to :supplier_category

  enum :supplier_importance => [:alta, :normal, :baixa]

  validates_presence_of :name, :city, :state, :supplier_importance
end
