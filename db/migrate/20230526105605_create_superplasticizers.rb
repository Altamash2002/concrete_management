class CreateSuperplasticizers < ActiveRecord::Migration[7.0]
  def change
    create_table :superplasticizers do |t|
      t.string :brand
      t.string :type
      t.float :dosage

      t.timestamps
    end
  end
end
