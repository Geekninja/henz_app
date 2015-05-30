class Sector < ActiveRecord::Base
  belongs_to :responsible, class_name: 'User'

  validates_presence_of :name, :acron
end
