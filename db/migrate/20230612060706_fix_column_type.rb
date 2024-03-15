class FixColumnType < ActiveRecord::Migration[7.0]
  def change
    remove_column :cements, :type
    remove_column :superplasticizers, :type
    remove_column :m_silicas, :type
    remove_column :m_admixtures, :type
  end
end
