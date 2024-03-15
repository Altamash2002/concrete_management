class RemoveReferenceFromConcrete < ActiveRecord::Migration[7.0]
  def change
    remove_reference :concretes, :building_master, null: false, foreign_key: true
  end
end
