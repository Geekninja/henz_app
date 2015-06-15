class Quotation < ActiveRecord::Base
  belongs_to :project
  belongs_to :responsible
end
