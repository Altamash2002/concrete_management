class AddMSilicaToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :m_silica, null: false, foreign_key: true, null: true
  end
end
