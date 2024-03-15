class RemoveReferenceFromBuildingMaster < ActiveRecord::Migration[7.0]
  def change
    # remove_reference :building_masters, :project_master, null: false, foreign_key: true
  end
end
