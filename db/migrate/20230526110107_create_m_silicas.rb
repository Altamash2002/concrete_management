class CreateMSilicas < ActiveRecord::Migration[7.0]
  def change
    create_table :m_silicas do |t|
      t.string :brand
      t.string :type
      t.integer :dosage

      t.timestamps
    end
  end
end
