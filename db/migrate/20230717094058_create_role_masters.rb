class CreateRoleMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :role_masters do |t|
      t.string :name

      t.timestamps
    end

    add_column :users, :role_master_id, :bigint
  end
end
