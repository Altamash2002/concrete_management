class MigrateStrengthTestingDailyTestingData < ActiveRecord::Migration[7.0]
  def change
    StrengthTesting.all.each do |strength_testing|
      strength_testing.create_daily_testings
    end
  end
end
