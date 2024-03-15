class CreateDay7Acceptances < ActiveRecord::Migration[7.0]
  def change
    create_table :day7_acceptances do |t|
      t.references :grade_master, null: false, foreign_key: true
      t.integer :strength_at_67p
      t.integer :strength_at_72p

      t.timestamps
    end
  end
end
