class ProjectFinance < ActiveRecord::Base
  belongs_to :project
  belongs_to :staff, class_name: "User"

  scope :by_period, -> started_at, ended_at {where(created_at: started_at..ended_at)}
  
  enum :finance_type => [:dinheiro, :cheque]
  enum :finance_target => [:obra, :funcionário]

  validates :staff, presence: true, if: :target_staff?

  validates_presence_of :title, :finance_type,:date, :description, :value
  validates_date :date
  validates :value, numericality: {only_float: true}

  private

  def target_staff?
    self.funcionário?
  end
end
