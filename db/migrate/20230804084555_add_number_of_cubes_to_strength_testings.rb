class AddNumberOfCubesToStrengthTestings < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :number_of_cubes, :integer
  end
end
