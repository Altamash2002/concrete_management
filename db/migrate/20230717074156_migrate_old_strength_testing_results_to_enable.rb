class MigrateOldStrengthTestingResultsToEnable < ActiveRecord::Migration[7.0]
  def change
    StrengthTesting.all.each do |strength_testing|
      strength_testing.enable_testing_days
    end
  end
end
