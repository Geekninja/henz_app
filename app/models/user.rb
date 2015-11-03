class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :project_privilege, class_name: "Project"
  validates_presence_of :name, :privilege

  enum :privilege => [:administrador, :gerente, :financeiro, :matriz]


  def project_privileges(privilege)
    self.project_privilege_id.to_a.include? privilege
  end
end
