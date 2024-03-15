class RemoveStuctureColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :structure_masters, :extra_cube
    remove_column :structure_masters, :total_cube
  end
end
