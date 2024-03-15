class AddIsRmcToRmcLists < ActiveRecord::Migration[7.0]
  def change
    add_column :rmc_lists, :is_rmc, :boolean
  end
end
