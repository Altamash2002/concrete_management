class AddLocationToStrengthTestings < ActiveRecord::Migration[7.0]
  def change
    add_column :strength_testings, :location, :string
  end
end
