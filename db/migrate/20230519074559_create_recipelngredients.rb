class CreateRecipelngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipelngredients do |t|
      t.string :title
      t.string :company
      t.string :city
      t.timestamps
    end
  end
end
