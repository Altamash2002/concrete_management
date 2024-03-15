class AddBuildingMasterToConcrete < ActiveRecord::Migration[7.0]
  def change
    add_reference :concretes, :building_master, null: false, foreign_key: true
  end
end
