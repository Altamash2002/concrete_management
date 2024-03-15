class RemoveStrengthTestingFromProjectMaster < ActiveRecord::Migration[7.0]
  def change
    remove_reference :project_masters, :strength_testing, foreign_key: true
  end
end
