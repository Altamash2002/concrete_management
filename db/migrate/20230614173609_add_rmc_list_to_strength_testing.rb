class AddRmcListToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    add_reference :strength_testings, :rmc_list, foreign_key: true
  end
end
