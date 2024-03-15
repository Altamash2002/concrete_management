class CreateMixDesigns < ActiveRecord::Migration[7.0]
  def change
    create_table :mix_designs do |t|
      t.string :title
      t.string :company
      t.string :city
      t.timestamps
    end
  end
end
