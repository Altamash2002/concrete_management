class CreateTestingDurationMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :testing_duration_masters do |t|
      t.string :name
      t.integer :contact_number
      t.string :location
      t.string :duration
      t.timestamps
    end
  end
end
