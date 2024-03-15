class CreateDailyTestings < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_testings do |t|
      t.references :strength_testing, null: false, foreign_key: true
      t.date :date
      t.string :slot_type

      t.timestamps
    end
  end
end
