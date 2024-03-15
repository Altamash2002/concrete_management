class AddColumnIsGreenToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :is_green, :boolean, default: false 
  end
end
