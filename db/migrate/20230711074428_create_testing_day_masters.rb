class CreateTestingDayMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :testing_day_masters do |t|
      t.string :day
      t.string :title
      t.integer :sequence
      t.timestamps
    end
  end
end
