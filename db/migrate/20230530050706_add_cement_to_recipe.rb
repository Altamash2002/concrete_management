class AddCementToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :cement, null: false, foreign_key: true,  null: true
  end
end
