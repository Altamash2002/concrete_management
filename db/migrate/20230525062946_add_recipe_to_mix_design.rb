class AddRecipeToMixDesign < ActiveRecord::Migration[7.0]
  def change
    add_reference :mix_designs, :recipe, null: false, foreign_key: true
  end
end
