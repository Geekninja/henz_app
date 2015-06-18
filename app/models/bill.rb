class Bill < ActiveRecord::Base
  belongs_to :bill_category
  belongs_to :project
  belongs_to :supplier

  attr_accessor :item_title, :item_quantity, :item_value, :item_type

  enum :bill_type => [:pagamento, :recebimento, :faturamento]

  validates_presence_of :bill_type, :bill_category, :name, :value, :deadline

  validates_date :deadline
end
