class CreateWaterReducerBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :water_reducer_brands do |t|
      t.string :title
      t.string :company
      t.string :city
      t.timestamps
    end
  end
end
