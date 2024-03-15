class AddColumnSequenceToTestingResult < ActiveRecord::Migration[7.0]
  def change
    add_column :testing_results, :sequence, :integer
    add_column :testing_results, :enable, :boolean, default: false
  end
end
