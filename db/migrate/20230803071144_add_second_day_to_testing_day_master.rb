class AddSecondDayToTestingDayMaster < ActiveRecord::Migration[7.0]
  def change
    TestingDayMaster.where('sequence > 0').each do |testing_day_master|
      testing_day_master.update!(sequence: testing_day_master.sequence + 1)
    end
    TestingDayMaster.create!(day: '2 days', title: '2 days', sequence: 1)
  end
end
