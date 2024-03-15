class AddConcreteToProjectMaster < ActiveRecord::Migration[7.0]
  def change
    add_reference :project_masters, :concrete, null: false, foreign_key: true, null: true
  end
end
