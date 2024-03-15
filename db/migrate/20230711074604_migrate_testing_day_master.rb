class MigrateTestingDayMaster < ActiveRecord::Migration[7.0]
  def change
    days = ['2 days', '3 days', '5 days', '7 days', '10 days', '14 days', '15 days', '28 days', '35 days', '45 days', '56 days', '90 days', '120 days']
    days.each_with_index do |day, index|
      TestingDayMaster.create(day: day, title: day, sequence: index)
    end
  end
end
