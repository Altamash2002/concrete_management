class AddRecipeToMAdmixture < ActiveRecord::Migration[7.0]
  def change
    add_reference :m_admixtures, :recipe, null: false, foreign_key: true
  end
end
