class AddColumnsToSuperplasticizer < ActiveRecord::Migration[7.0]
  def change
    add_column :superplasticizers, :base_of_plasticizer, :string
    add_column :superplasticizers, :plasticizer_in_kg_per_m3, :float
  end
end
