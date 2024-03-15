class CreateDay3Acceptances < ActiveRecord::Migration[7.0]
  def change
    create_table :day3_acceptances do |t|
      t.references :grade_master, null: false, foreign_key: true
      t.integer :strength_at_50p

      t.timestamps
    end
  end
end
