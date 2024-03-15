class CreateDay28Acceptances < ActiveRecord::Migration[7.0]
  def change
    create_table :day28_acceptances do |t|
      t.references :grade_master, null: false, foreign_key: true
      t.integer :strength_at_100p

      t.timestamps
    end
  end
end
