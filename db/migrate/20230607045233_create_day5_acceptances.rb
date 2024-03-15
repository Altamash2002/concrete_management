class CreateDay5Acceptances < ActiveRecord::Migration[7.0]
  def change
    create_table :day5_acceptances do |t|
      t.references :grade_master, null: false, foreign_key: true
      t.integer :strength_at_70p
      t.integer :strength_at_75p

      t.timestamps
    end
  end
end
