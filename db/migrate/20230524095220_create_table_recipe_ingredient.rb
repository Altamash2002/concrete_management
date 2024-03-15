class CreateTableRecipeIngredient < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingredients do |t|
      t.string :title
      t.string :company
      t.string :city
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
