class AddConcreteToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :concrete, null: false, foreign_key: true
  end
end
