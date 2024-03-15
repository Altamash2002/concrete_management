class AddRecipeToCement < ActiveRecord::Migration[7.0]
  def change
    add_reference :cements, :recipe, null: false, foreign_key: true
  end
end
