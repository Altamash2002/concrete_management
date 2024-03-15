class FixAllTableColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :cements, :wb_ratio
    remove_column :cements, :dosage
    remove_column :m_admixtures, :dosage
    remove_column :m_silicas, :dosage
    remove_column :project_masters, :date
    remove_column :superplasticizers, :dosage
  end
end
