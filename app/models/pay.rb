class Pay < ActiveRecord::Base
  belongs_to :bill_category
  belongs_to :project
  belongs_to :supplier

  validates_presence_of  :bill_category, :name, :deadline
  validates :value, numericality: {only_float: true}, allow_blank: true

  validates_date :deadline

  mount_uploader :archive, PayUploader
end
