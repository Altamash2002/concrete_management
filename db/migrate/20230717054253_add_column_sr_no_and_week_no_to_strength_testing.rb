class AddColumnSrNoAndWeekNoToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :sr_no, :integer
    add_column :strength_testings, :week_no, :integer
    # add_column :week_no, :integer
  end
end
