class SupplierCategory < ActiveRecord::Base
  validates :name, presence: true
end
