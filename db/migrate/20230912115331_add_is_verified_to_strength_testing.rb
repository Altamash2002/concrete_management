class AddIsVerifiedToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :is_verified, :boolean, default: false
  end
end
