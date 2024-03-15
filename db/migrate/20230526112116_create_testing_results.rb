class CreateTestingResults < ActiveRecord::Migration[7.0]
  def change
    create_table :testing_results do |t|
      t.string :slot_type
      t.integer :result_value
      t.integer :attempts
      t.string :pass_status

      t.timestamps
    end
  end
end
