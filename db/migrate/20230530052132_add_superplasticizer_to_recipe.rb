class AddSuperplasticizerToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :superplasticizer, null: false, foreign_key: true, null: true
  end
end
