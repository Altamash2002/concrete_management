class CreateStrengthAcceptances < ActiveRecord::Migration[7.0]
  def change
    create_table :strength_acceptances do |t|
      t.string :grade
      t.string :day
      t.float :percentage
      t.float :value

      t.timestamps
    end
  end
end
