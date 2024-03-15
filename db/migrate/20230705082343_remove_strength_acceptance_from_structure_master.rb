class RemoveStrengthAcceptanceFromStructureMaster < ActiveRecord::Migration[7.0]
  def change
    # remove_reference :structure_masters, :strength_acceptance, null: false, foreign_key: false
  end
end
