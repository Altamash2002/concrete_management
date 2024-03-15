class RemoveStrengthAcceptanceIdFromStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    remove_reference :strength_testings, :strength_acceptance, null: false, foreign_key: true
  end
end
