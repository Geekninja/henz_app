class BillProduct < ActiveRecord::Base
  belongs_to :bill

  enum :type_product => [:produto, :serviço, :outros]
  
  validates :title, presence: true
  validates :description, presence: true
  validates :type_product, presence: true
  validates :quantity, presence: true, numericality: true
  validates :value,  numericality: {only_float: true}

end
