class RemoveConcreteFromProjectMaster < ActiveRecord::Migration[7.0]
  def change
    remove_reference :project_masters, :concrete, foreign_key: true
  end
end
