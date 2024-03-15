class MigrateRoleDataInRoleMaster < ActiveRecord::Migration[7.0]
  def change
    roles = ['Admin', 'Supervisor', 'User']
    roles.each do |role|
      RoleMaster.create(name: role)
    end
    User.where(is_admin: false).update_all(role_master_id: RoleMaster.find_by(name: 'User').id)
    User.where(is_admin: true).update_all(role_master_id: RoleMaster.find_by(name: 'Admin').id)
  end
end
