class ProjectFinance < ActiveRecord::Base
  belongs_to :project

  enum :finance_type => [:dinheiro, :cheque]

  validates_presence_of :title, :finance_type, :month, :year, :date, :description, :value
  validates_numericality_of :month, :year
  validates_date :date
  validates :value, numericality: {only_float: true}, allow_blank: true

end
