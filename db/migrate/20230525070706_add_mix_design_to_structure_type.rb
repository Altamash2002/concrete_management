class AddMixDesignToStructureType < ActiveRecord::Migration[7.0]
  def change
    add_reference :structure_types, :mix_design, null: false, foreign_key: true
  end
end
