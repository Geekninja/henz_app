class ProjectFund < ActiveRecord::Base

  belongs_to :project
  belongs_to :supplier
  belongs_to :staff, class_name: "User"

  enum pay_target: ['obra', 'funcionário']
  
  validates_presence_of :name, :value, :description, :date_payment
  validates :value, numericality: {only_float: true}

  mount_uploader :note_payment, PayUploader

end
