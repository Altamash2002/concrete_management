class AddSuperplasticizerBrandToSuperplasticizerType < ActiveRecord::Migration[7.0]
  def change
    add_reference :superplasticizer_types, :superplasticizer_brand, null: false, foreign_key: true
  end
end
