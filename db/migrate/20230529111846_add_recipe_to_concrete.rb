class AddRecipeToConcrete < ActiveRecord::Migration[7.0]
  def change
    add_reference :concretes, :recipe, null: false, foreign_key: true, null: true
  end
end
