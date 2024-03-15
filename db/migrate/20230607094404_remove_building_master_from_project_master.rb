class RemoveBuildingMasterFromProjectMaster < ActiveRecord::Migration[7.0]
  def change
    remove_reference :project_masters, :building_master, foreign_key: true
  end
end
