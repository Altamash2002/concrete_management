class RemoveRecipeFromStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    remove_reference :strength_testings, :recipe, null: false, foreign_key: true
  end
end
