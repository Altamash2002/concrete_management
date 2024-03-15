class AddStrengthTestingToProjectMaster < ActiveRecord::Migration[7.0]
  def change
    add_reference :project_masters, :strength_testing, null: false, foreign_key: true, null: true
  end
end
