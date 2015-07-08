class ProjectFund < ActiveRecord::Base

  belongs_to :project
  belongs_to :supplier

  validates_presence_of :name, :value, :description, :date_payment, :note_payment
  validates :value, numericality: {only_float: true}, allow_blank: true  

 mount_uploader :note_payment, PayUploader

end
