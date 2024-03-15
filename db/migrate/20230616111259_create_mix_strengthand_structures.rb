class CreateMixStrengthandStructures < ActiveRecord::Migration[7.0]
  def change
    create_table :mix_strengthand_structures do |t|
      t.references :structure_master, null: false, foreign_key: true
      t.references :acceptance_strength, null: false, foreign_key: true
      t.string :structure_name
      t.integer :number
      t.timestamps
    end
  end
end
