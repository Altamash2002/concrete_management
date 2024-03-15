class CreateAcceptanceStrengths < ActiveRecord::Migration[7.0]
  def change
    create_table :acceptance_strengths do |t|
      t.string :title

      t.timestamps
    end
  end
end
