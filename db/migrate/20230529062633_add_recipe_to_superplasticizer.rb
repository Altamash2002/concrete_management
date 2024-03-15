class AddRecipeToSuperplasticizer < ActiveRecord::Migration[7.0]
  def change
    add_reference :superplasticizers, :recipe, null: false, foreign_key: true
  end
end
