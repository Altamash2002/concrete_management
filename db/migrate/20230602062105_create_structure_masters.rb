class CreateStructureMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :structure_masters do |t|
      t.string :name

      t.timestamps
    end
  end
end
