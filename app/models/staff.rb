class Staff < ActiveRecord::Base
  belongs_to :job
  belongs_to :sector
  belongs_to :project
  belongs_to :office
  belongs_to :office_support


  validates_presence_of :name, :code, :cpf, :job, :city, :state, :telphone, :born
  validates :telphone, numericality: true
  validates_numericality_of :telphone_optional, :celphone, allow_blank: true
  validates :cpf, cpf: true
  validates_date :born

end

