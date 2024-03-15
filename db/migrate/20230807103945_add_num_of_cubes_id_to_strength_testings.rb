class AddNumOfCubesIdToStrengthTestings < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :num_of_cubes_id, :bigint
  end
end
