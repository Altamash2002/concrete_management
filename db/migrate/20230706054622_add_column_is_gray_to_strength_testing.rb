class AddColumnIsGrayToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :is_gray, :boolean, default: false 
  end
end
