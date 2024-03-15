class AddBuildingMasterToProjectMaster < ActiveRecord::Migration[7.0]
  def change
    add_reference :project_masters, :building_master, null: false, foreign_key: true, null: true
  end
end
