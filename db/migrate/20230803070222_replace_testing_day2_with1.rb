class ReplaceTestingDay2With1 < ActiveRecord::Migration[7.0]
  def change
    first_day = TestingDayMaster.find_by(day: '2 days')
    first_day.update(day: '1 days', title: '1 days')
    first_day.acceptance_strengths.update_all(title: '1 days')
    TestingResult.where(slot_type: '2 days').update_all(slot_type: '1 days')
  end
end
