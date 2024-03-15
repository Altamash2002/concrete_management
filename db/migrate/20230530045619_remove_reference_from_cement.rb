class RemoveReferenceFromCement < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cements, :recipe, null: false, foreign_key: true
  end
end
