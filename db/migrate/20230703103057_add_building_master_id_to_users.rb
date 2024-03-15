class AddBuildingMasterIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :building_master_id, :integer
  end
end
