class Job < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :salary, numericality: true, allow_blank: true

  scope :enableds, -> { where(status: true)}
end
