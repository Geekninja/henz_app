class OfficeSupport < ActiveRecord::Base
  belongs_to :responsible
  belongs_to :project
  belongs_to :office
end
