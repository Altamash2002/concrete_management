class AddIndexOnTestingResults < ActiveRecord::Migration[7.0]
  def change
    add_index :testing_results, [:strength_testing_id, :slot_type, :attempts], unique: true, name: :index_testing_result_st_id_slot_type_attempts
  end
end
