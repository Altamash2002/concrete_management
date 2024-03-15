class CreateNumOfCubes < ActiveRecord::Migration[7.0]
  def change
    create_table :num_of_cubes do |t|
      t.integer :count

      t.timestamps
    end
  end
end
