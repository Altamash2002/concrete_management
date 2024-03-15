class RemoveAcceptanceStrengthFromStructureMaster < ActiveRecord::Migration[7.0]
  def change
    remove_reference :structure_masters, :acceptance_strength, null: false, foreign_key: true
  end
end
