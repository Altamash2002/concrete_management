class CreateBinder2s < ActiveRecord::Migration[7.0]
  def change
    create_table :binder2s do |t|
      t.string :name
      t.integer :dosage

      t.timestamps
    end
  end
end
