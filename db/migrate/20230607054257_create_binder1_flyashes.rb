class CreateBinder1Flyashes < ActiveRecord::Migration[7.0]
  def change
    create_table :binder1_flyashes do |t|
      t.string :name
      t.integer :dosage

      t.timestamps
    end
  end
end
