class AddGradeMasterIdToStrengthTestings < ActiveRecord::Migration[7.0]
  def change
    # add_reference :strength_testings, :grade_master, null: true, foreign_key: true
  end
end
