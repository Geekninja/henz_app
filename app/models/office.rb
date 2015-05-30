class Office < ActiveRecord::Base
  belongs_to :responsible
  belongs_to :project
end
