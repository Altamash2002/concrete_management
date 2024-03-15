class AddColumnIsRedToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :is_red, :boolean, default: false
  end
end
