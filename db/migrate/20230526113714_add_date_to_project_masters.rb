class AddDateToProjectMasters < ActiveRecord::Migration[7.0]
  def change
    add_column :project_masters, :date, :date
  end
end
