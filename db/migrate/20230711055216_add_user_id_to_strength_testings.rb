class AddUserIdToStrengthTestings < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :user_id, :bigint
  end
end
