class Job < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :salary, numericality: {only_float: true}, allow_blank: true

  default_scope -> { where(status: true)}
end
