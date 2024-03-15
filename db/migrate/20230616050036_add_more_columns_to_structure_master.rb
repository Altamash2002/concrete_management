class AddMoreColumnsToStructureMaster < ActiveRecord::Migration[7.0]
  def change 
    add_column :structure_masters, :extra_cube, :string
    add_column :structure_masters, :total_cube, :string
  end
end
