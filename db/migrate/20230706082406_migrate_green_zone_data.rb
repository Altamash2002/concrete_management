class MigrateGreenZoneData < ActiveRecord::Migration[7.0]
  def change
    @strength_testings = StrengthTesting.all
    @strength_testings.each do |st|
      st.check_and_set_green
    end
  end
end