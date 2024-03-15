class CreateCementTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :cement_types do |t|
      t.string :title
      t.string :company
      t.integer :contact_number
      t.string :location
      t.timestamps
    end
  end
end
