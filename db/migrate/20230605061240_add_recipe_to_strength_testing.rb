class AddRecipeToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    add_reference :strength_testings, :recipe, foreign_key: true
  end
end
