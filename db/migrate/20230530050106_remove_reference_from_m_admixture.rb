class RemoveReferenceFromMAdmixture < ActiveRecord::Migration[7.0]
  def change
    remove_reference :m_admixtures, :recipe, null: false, foreign_key: true
  end
end
