class CreateStrengthTestings < ActiveRecord::Migration[7.0]
  def change
    create_table :strength_testings do |t|
      t.integer :density
      t.string :remark

      t.timestamps
    end
  end
end
