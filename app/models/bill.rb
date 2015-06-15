class Bill < ActiveRecord::Base
  belongs_to :bill_category
  belongs_to :project
  belongs_to :supplier

  enum :bill_type => [:pagamento, :recebimento, :faturamento]
  
end
