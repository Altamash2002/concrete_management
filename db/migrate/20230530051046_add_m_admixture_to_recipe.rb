class AddMAdmixtureToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :m_admixture, null: false, foreign_key: true, null: true
  end
end
