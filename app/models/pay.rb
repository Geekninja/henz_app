class Pay < ActiveRecord::Base
  belongs_to :bill_category
  belongs_to :project
  belongs_to :supplier

  validates_presence_of  :bill_category, :name, :deadline
  validates :value, numericality: {only_float: true}, allow_blank: true


  scope :filter, -> (start_date, end_date) {where(created_at: start_date..end_date)}

  mount_uploader :archive, PayUploader
  mount_uploader :note_payment, PayUploader

  validates_date :date_payment, if: :payment? 
  validates_date :deadline

  private

  def payment?
    self.status
  end
end
