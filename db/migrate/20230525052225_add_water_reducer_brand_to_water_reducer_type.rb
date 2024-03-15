class AddWaterReducerBrandToWaterReducerType < ActiveRecord::Migration[7.0]
  def change
    add_reference :water_reducer_types, :water_reducer_brand, null: false, foreign_key: true
  end
end
