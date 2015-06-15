class Budget < ActiveRecord::Base
  belongs_to :quotation
  belongs_to :supplier
end
