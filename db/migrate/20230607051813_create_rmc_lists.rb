class CreateRmcLists < ActiveRecord::Migration[7.0]
  def change
    create_table :rmc_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
