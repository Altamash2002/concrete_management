class AddNewDensityToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :new_density, :integer
  end
end
