class AddStructureMasterIdToAcceptanceStrengths < ActiveRecord::Migration[7.0]
  def change
    # add_reference :acceptance_strengths, :structure_master, null: true, foreign_key: true
  end
end
