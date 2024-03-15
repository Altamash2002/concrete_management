class RemoveRecipeFromConcrete < ActiveRecord::Migration[7.0]
  def change
    remove_reference :concretes, :recipe, foreign_key: true
  end
end
