class StaffProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :staff
end
