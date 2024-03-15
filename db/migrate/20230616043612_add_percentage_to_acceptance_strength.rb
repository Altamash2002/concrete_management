class AddPercentageToAcceptanceStrength < ActiveRecord::Migration[7.0]
  def change
    add_column :acceptance_strengths, :percentage, :float
  end
end
