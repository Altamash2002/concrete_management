class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :building_masters
  
  belongs_to :project_master, optional: true
  has_many :strength_testings
  has_many :testing_results

  belongs_to :role_master, optional: true

  def admin?
  	is_admin || role_master&.name == RoleMaster::ADMIN_ROLE_TITLE
  end

  def supervisor?
  	role_master&.name == RoleMaster::SUPERVISOR_ROLE_TITLE
  end

  def admin_or_supervisor_or_main_lab_incharge?
    admin? || supervisor? || main_lab_incharge?
  end

  def normal_user?
  	!admin? && !supervisor? && !main_lab_incharge?
  end

  def ceo?
    role_master&.name == RoleMaster::CEO_ROLE_TITLE
  end

  def main_lab_incharge?
    role_master&.name == RoleMaster::MAIN_LAB_INCHARGE_ROLE_TITLE
  end

  def qa_lab_incharge?
    role_master&.name == RoleMaster::QA_LAB_INCHARGE_ROLE_TITLE
  end

  def lab_technician?
    role_master&.name == RoleMaster::LAB_TECHNICIAN_ROLE_TITLE
  end

  def site_incharge?
    role_master&.name == RoleMaster::SITE_INCHARGE_ROLE_TITLE
  end

  def project_incharge?
    role_master&.name == RoleMaster::PROJECT_INCHARGE_ROLE_TITLE
  end
end 



