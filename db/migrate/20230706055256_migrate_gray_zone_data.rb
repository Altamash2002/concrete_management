class MigrateGrayZoneData < ActiveRecord::Migration[7.0]
  def change
    @strength_testings = StrengthTesting.all
    @strength_testings.each do |st|
      st.check_and_set_gray
    end
  end
end
