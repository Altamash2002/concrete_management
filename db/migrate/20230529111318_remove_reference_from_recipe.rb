class RemoveReferenceFromRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_reference :recipes, :concrete, null: false, foreign_key: true
  end
end
