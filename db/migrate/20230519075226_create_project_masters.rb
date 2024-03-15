class CreateProjectMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :project_masters do |t|
      t.string :name
      t.string :company
      t.integer :contact_number
      t.string :location
      t.timestamps
    end
  end
end
