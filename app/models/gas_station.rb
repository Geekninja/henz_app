class GasStation < ActiveRecord::Base
  validates_presence_of :name, :city, :state
end
