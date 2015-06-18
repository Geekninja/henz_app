class Bill < ActiveRecord::Base
  belongs_to :bill_category
  belongs_to :project
  belongs_to :supplier

  has_many :bill_products

  accepts_nested_attributes_for :bill_products, allow_destroy: true

  enum :bill_type => [:pagamento, :compra,  :recebimento, :faturamento, :orçamento]

  validates_presence_of :bill_type, :bill_category, :name, :deadline
  validates :value, numericality: {only_float: true}, allow_blank: true

  validates_date :deadline

end
