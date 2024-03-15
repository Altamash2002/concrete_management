class CreateStandardDeviations < ActiveRecord::Migration[7.0]
  def change
    create_table :standard_deviations do |t|
      t.string :grade
      t.float :v_good
      t.float :good
      t.float :fair

      t.timestamps
    end
  end
end
