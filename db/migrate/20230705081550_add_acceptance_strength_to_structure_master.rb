class AddAcceptanceStrengthToStructureMaster < ActiveRecord::Migration[7.0]
  def change
    add_reference :structure_masters, :acceptance_strength, foreign_key: true
  end
end
