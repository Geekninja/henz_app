class ProjectFinance < ActiveRecord::Base
  belongs_to :project

  enum :finance_type => [:dinheiro, :cheque]

  validates_presence_of :title, :finance_type, :month, :year, :date
end
