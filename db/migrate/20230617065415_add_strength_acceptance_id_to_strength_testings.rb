class AddStrengthAcceptanceIdToStrengthTestings < ActiveRecord::Migration[7.0]
  def change
    add_reference :strength_testings, :strength_acceptance, foreign_key: true
  end
end
