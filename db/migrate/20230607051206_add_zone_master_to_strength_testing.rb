class AddZoneMasterToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    add_reference :strength_testings, :zone_master, foreign_key: true
  end
end
