class AddSpStrengthToStructureMaster < ActiveRecord::Migration[7.0]
  def change
    add_column :structure_masters, :sp_strength, :string
  end
end
