class AddProjectMasterIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :project_master_id, :integer
  end
end
