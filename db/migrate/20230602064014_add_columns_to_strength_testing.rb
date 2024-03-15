class AddColumnsToStrengthTesting < ActiveRecord::Migration[7.0]
  def change
    # Add new references to BuildingMaster
    add_column :strength_testings, :project_master_id, :bigint, index: true
    add_column :strength_testings, :building_master_id, :bigint, index: true, forign_key: true
    add_column :strength_testings, :structure_master_id, :bigint, index: true, forign_key: true
    add_column :strength_testings, :strength_acceptance_id, :bigint, index: true, forign_key: true

    # add_column :strength_testings, :grade_master_id, :bigint, index: true, forign_key: true
    add_column :strength_testings, :concrete_id, :bigint, index: true, forign_key: true
    add_column :strength_testings, :cement_id, :bigint, index: true, forign_key: true
    add_column :strength_testings, :s_plasticizer_id, :bigint, index: true, forign_key: true
    add_column :strength_testings, :m_admixture_id, :bigint, index: true, forign_key: true
    add_column :strength_testings, :m_silica_id, :bigint, index: true, forign_key: true
 

    add_column :strength_testings, :date, :date
    add_column :strength_testings, :w_b_ratio, :float
    add_column :strength_testings, :cement_c_c_kg_m3, :float
    add_column :strength_testings, :s_plasticizer_dosage, :float
    add_column :strength_testings, :m_admixture_dosage, :float
    add_column :strength_testings, :m_silica_dosage, :float
  end
end
