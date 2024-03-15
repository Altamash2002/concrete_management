class AddRecipeToMSilica < ActiveRecord::Migration[7.0]
  def change
    add_reference :m_silicas, :recipe, null: false, foreign_key: true
  end
end
