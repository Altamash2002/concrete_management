class CreateSuperplasticizerBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :superplasticizer_brands do |t|
      t.string :title
      t.string :company
      t.string :city

      t.timestamps
    end
  end
end
