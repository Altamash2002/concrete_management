class AddUserIdToBuildingMasters < ActiveRecord::Migration[7.0]
  def change
    add_reference :building_masters, :user, null: true, foreign_key: true
  end
end
