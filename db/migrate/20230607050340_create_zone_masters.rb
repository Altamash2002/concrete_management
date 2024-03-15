class CreateZoneMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :zone_masters do |t|
      t.string :name

      t.timestamps
    end
  end
end
