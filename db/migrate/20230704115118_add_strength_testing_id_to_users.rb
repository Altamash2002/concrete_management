class AddStrengthTestingIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :strength_testing_id, :integer
  end
end
