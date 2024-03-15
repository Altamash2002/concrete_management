class RemoveReferenceFromSuperplasticizer < ActiveRecord::Migration[7.0]
  def change
    remove_reference :superplasticizers, :recipe, null: false, foreign_key: true
  end
end
