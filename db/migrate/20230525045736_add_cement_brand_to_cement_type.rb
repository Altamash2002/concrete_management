class AddCementBrandToCementType < ActiveRecord::Migration[7.0]
  def change
    add_reference :cement_types, :cement_brand, null: false, foreign_key: true
  end
end
