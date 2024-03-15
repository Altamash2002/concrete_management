class CreateConcreteMixDesignRmcs < ActiveRecord::Migration[7.0]
  def change
    create_table :concrete_mix_design_rmcs do |t|
      t.references :project_master, null: false, foreign_key: true
      t.references :building_master, null: false, foreign_key: true
      t.references :contractor_master, null: false, foreign_key: true
      t.references :rmc_list, null: false, foreign_key: true
      t.references :acceptance_strength, null: false, foreign_key: true
      t.string :revision
      t.references :grade_master, null: false, foreign_key: true
      t.float :wb_ratio
      t.float :cement_content_kg_per_m3
      t.float :Binder1_FlyAsh_kg_per_m3
      t.float :third_binder
      t.float :water_in_ltrs_per_m3
      t.float :ca2_20mm_in_kg_per_m3
      t.float :ca1_10mm_in_kg_per_m3
      t.float :manufactured_sand_in_kg_per_m3
      t.float :wash_sand_in_kg_per_m3
      t.references :cement, null: false, foreign_key: true
      t.references :superplasticizer, null: false, foreign_key: true
      t.float :plasticizer_percent_wt_of_c_plus_f
      t.float :platicizer_in_kg_per_m3
      t.references :structure_master, null: false, foreign_key: true
      t.date :date
      t.string :remark

      t.timestamps
    end
  end
end
