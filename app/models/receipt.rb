class Receipt < ActiveRecord::Base
  belongs_to :bill_category
  validates_presence_of :name, :description, :value, :deadline
  validates :value, numericality: {only_float: true}, allow_blank: true

  mount_uploader :archive, PayUploader

  validates_date :date_payment, allow_blank: true
end
