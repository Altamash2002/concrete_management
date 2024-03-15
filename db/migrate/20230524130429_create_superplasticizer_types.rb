class CreateSuperplasticizerTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :superplasticizer_types do |t|
      t.string :title
      t.string :type
      t.string :company
      t.string :city

      t.timestamps
    end
  end
end
