class AddProjectMasterToBuildingMaster < ActiveRecord::Migration[7.0]
  def change
    add_reference :building_masters, :project_master, foreign_key: true
  end
end
