class RemoveZoneMasterFromStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    remove_reference :strength_testings, :zone_master, null: false, foreign_key: true
  end
end
