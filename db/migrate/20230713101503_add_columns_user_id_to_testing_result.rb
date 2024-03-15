class AddColumnsUserIdToTestingResult < ActiveRecord::Migration[7.0]
  def change
    add_column :testing_results, :user_id, :bigint
  end
end
