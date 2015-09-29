class ProjectFinance < ActiveRecord::Base
  belongs_to :project

  enum :finance_type => [:dinheiro, :cheque]

  validates_presence_of :title, :finance_type,:date, :description, :value
  validates_date :date
  validates :value, numericality: {only_float: true}, allow_blank: true

end
