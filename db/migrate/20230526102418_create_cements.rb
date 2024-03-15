class CreateCements < ActiveRecord::Migration[7.0]
  def change
    create_table :cements do |t|
      t.string :brand
      t.string :type
      t.float :wb_ratio
      t.integer :dosage

      t.timestamps
    end
  end
end
