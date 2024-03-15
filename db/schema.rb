# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_13_093049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptance_strengths", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "percentage"
    t.bigint "testing_day_master_id"
    t.bigint "structure_master_id"
  end

  create_table "binder1_flyashes", force: :cascade do |t|
    t.string "name"
    t.integer "dosage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "binder2s", force: :cascade do |t|
    t.string "name"
    t.integer "dosage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "binder3s", force: :cascade do |t|
    t.string "name"
    t.integer "dosage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "building_masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_master_id"
    t.bigint "user_id"
    t.index ["project_master_id"], name: "index_building_masters_on_project_master_id"
    t.index ["user_id"], name: "index_building_masters_on_user_id"
  end

  create_table "cement_brands", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.integer "contact_number"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cement_types", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.integer "contact_number"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cement_brand_id", null: false
    t.index ["cement_brand_id"], name: "index_cement_types_on_cement_brand_id"
  end

  create_table "cements", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concrete_mix_design_rmcs", force: :cascade do |t|
    t.bigint "project_master_id", null: false
    t.bigint "building_master_id", null: false
    t.bigint "contractor_master_id", null: false
    t.bigint "rmc_list_id", null: false
    t.bigint "acceptance_strength_id", null: false
    t.string "revision"
    t.bigint "grade_master_id", null: false
    t.float "wb_ratio"
    t.float "cement_content_kg_per_m3"
    t.float "Binder1_FlyAsh_kg_per_m3"
    t.float "third_binder"
    t.float "water_in_ltrs_per_m3"
    t.float "ca2_20mm_in_kg_per_m3"
    t.float "ca1_10mm_in_kg_per_m3"
    t.float "manufactured_sand_in_kg_per_m3"
    t.float "wash_sand_in_kg_per_m3"
    t.bigint "cement_id", null: false
    t.bigint "superplasticizer_id", null: false
    t.float "plasticizer_percent_wt_of_c_plus_f"
    t.float "platicizer_in_kg_per_m3"
    t.bigint "structure_master_id", null: false
    t.date "date"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acceptance_strength_id"], name: "index_concrete_mix_design_rmcs_on_acceptance_strength_id"
    t.index ["building_master_id"], name: "index_concrete_mix_design_rmcs_on_building_master_id"
    t.index ["cement_id"], name: "index_concrete_mix_design_rmcs_on_cement_id"
    t.index ["contractor_master_id"], name: "index_concrete_mix_design_rmcs_on_contractor_master_id"
    t.index ["grade_master_id"], name: "index_concrete_mix_design_rmcs_on_grade_master_id"
    t.index ["project_master_id"], name: "index_concrete_mix_design_rmcs_on_project_master_id"
    t.index ["rmc_list_id"], name: "index_concrete_mix_design_rmcs_on_rmc_list_id"
    t.index ["structure_master_id"], name: "index_concrete_mix_design_rmcs_on_structure_master_id"
    t.index ["superplasticizer_id"], name: "index_concrete_mix_design_rmcs_on_superplasticizer_id"
  end

  create_table "concrete_mix_design_sites", force: :cascade do |t|
    t.bigint "project_master_id", null: false
    t.bigint "building_master_id", null: false
    t.bigint "contractor_master_id", null: false
    t.bigint "acceptance_strength_id", null: false
    t.string "revision"
    t.bigint "grade_master_id", null: false
    t.float "wb_ratio"
    t.float "cement_content_kg_per_m3"
    t.float "binder1_flyash_kg_per_m3"
    t.string "third_binder"
    t.float "water_in_ltrs_per_m3"
    t.float "ca2_20mm_in_kg_per_m3"
    t.float "ca1_10mm_in_kg_per_m3"
    t.float "fa2_in_kg_per_m3"
    t.float "manufactured_sand_in_kg_per_m3"
    t.bigint "cement_id", null: false
    t.bigint "superplasticizer_id", null: false
    t.string "plasticizer_percent_wt_of_c_plus_f"
    t.float "plasticizer_in_kg_per_m3"
    t.string "remarks"
    t.date "date"
    t.string "latest"
    t.string "plant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acceptance_strength_id"], name: "index_concrete_mix_design_sites_on_acceptance_strength_id"
    t.index ["building_master_id"], name: "index_concrete_mix_design_sites_on_building_master_id"
    t.index ["cement_id"], name: "index_concrete_mix_design_sites_on_cement_id"
    t.index ["contractor_master_id"], name: "index_concrete_mix_design_sites_on_contractor_master_id"
    t.index ["grade_master_id"], name: "index_concrete_mix_design_sites_on_grade_master_id"
    t.index ["project_master_id"], name: "index_concrete_mix_design_sites_on_project_master_id"
    t.index ["superplasticizer_id"], name: "index_concrete_mix_design_sites_on_superplasticizer_id"
  end

  create_table "concretes", force: :cascade do |t|
    t.string "rmc_site_concrete"
    t.string "structure"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contractor_masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_testings", force: :cascade do |t|
    t.bigint "strength_testing_id", null: false
    t.date "date"
    t.string "slot_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["strength_testing_id"], name: "index_daily_testings_on_strength_testing_id"
  end

  create_table "day15_acceptances", force: :cascade do |t|
    t.bigint "grade_master_id", null: false
    t.integer "strength_at_80p"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_master_id"], name: "index_day15_acceptances_on_grade_master_id"
  end

  create_table "day28_acceptances", force: :cascade do |t|
    t.bigint "grade_master_id", null: false
    t.integer "strength_at_100p"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_master_id"], name: "index_day28_acceptances_on_grade_master_id"
  end

  create_table "day3_acceptances", force: :cascade do |t|
    t.bigint "grade_master_id", null: false
    t.integer "strength_at_50p"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_master_id"], name: "index_day3_acceptances_on_grade_master_id"
  end

  create_table "day5_acceptances", force: :cascade do |t|
    t.bigint "grade_master_id", null: false
    t.integer "strength_at_70p"
    t.integer "strength_at_75p"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_master_id"], name: "index_day5_acceptances_on_grade_master_id"
  end

  create_table "day7_acceptances", force: :cascade do |t|
    t.bigint "grade_master_id", null: false
    t.integer "strength_at_67p"
    t.integer "strength_at_72p"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_master_id"], name: "index_day7_acceptances_on_grade_master_id"
  end

  create_table "grade_masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_admixtures", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_silicas", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mix_designs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recipe_id", null: false
    t.index ["recipe_id"], name: "index_mix_designs_on_recipe_id"
  end

  create_table "mix_strengthand_structures", force: :cascade do |t|
    t.bigint "structure_master_id", null: false
    t.bigint "acceptance_strength_id", null: false
    t.string "structure_name"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acceptance_strength_id"], name: "index_mix_strengthand_structures_on_acceptance_strength_id"
    t.index ["structure_master_id"], name: "index_mix_strengthand_structures_on_structure_master_id"
  end

  create_table "num_of_cubes", force: :cascade do |t|
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cement_id"
    t.bigint "m_admixture_id"
    t.bigint "m_silica_id"
    t.bigint "superplasticizer_id"
    t.index ["cement_id"], name: "index_recipes_on_cement_id"
    t.index ["m_admixture_id"], name: "index_recipes_on_m_admixture_id"
    t.index ["m_silica_id"], name: "index_recipes_on_m_silica_id"
    t.index ["superplasticizer_id"], name: "index_recipes_on_superplasticizer_id"
  end

  create_table "rmc_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_rmc"
  end

  create_table "role_masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standard_deviations", force: :cascade do |t|
    t.string "grade"
    t.float "v_good"
    t.float "good"
    t.float "fair"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strength_acceptances", force: :cascade do |t|
    t.string "grade"
    t.string "day"
    t.float "percentage"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strength_testings", force: :cascade do |t|
    t.integer "density"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_master_id"
    t.bigint "building_master_id"
    t.bigint "structure_master_id"
    t.bigint "grade_master_id"
    t.bigint "cement_id"
    t.bigint "s_plasticizer_id"
    t.bigint "m_admixture_id"
    t.bigint "m_silica_id"
    t.date "date"
    t.float "w_b_ratio"
    t.float "cement_c_c_kg_m3"
    t.float "s_plasticizer_dosage"
    t.float "m_admixture_dosage"
    t.float "m_silica_dosage"
    t.bigint "rmc_list_id"
    t.boolean "is_gray", default: false
    t.boolean "is_red", default: false
    t.boolean "is_green", default: false
    t.bigint "user_id"
    t.integer "sr_no"
    t.integer "week_no"
    t.integer "number_of_cubes"
    t.bigint "num_of_cubes_id"
    t.string "location"
    t.integer "new_density"
    t.boolean "is_verified", default: false
    t.index ["rmc_list_id"], name: "index_strength_testings_on_rmc_list_id"
  end

  create_table "structure_masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sp_strength"
  end

  create_table "structure_types", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mix_design_id", null: false
    t.index ["mix_design_id"], name: "index_structure_types_on_mix_design_id"
  end

  create_table "superplasticizer_brands", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "superplasticizer_types", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.string "company"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "superplasticizer_brand_id", null: false
    t.index ["superplasticizer_brand_id"], name: "index_superplasticizer_types_on_superplasticizer_brand_id"
  end

  create_table "superplasticizers", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "base_of_plasticizer"
    t.float "plasticizer_in_kg_per_m3"
  end

  create_table "testing_day_masters", force: :cascade do |t|
    t.string "day"
    t.string "title"
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testing_duration_masters", force: :cascade do |t|
    t.string "name"
    t.integer "contact_number"
    t.string "location"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testing_results", force: :cascade do |t|
    t.string "slot_type"
    t.integer "result_value"
    t.integer "attempts"
    t.string "pass_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "strength_testing_id", null: false
    t.bigint "user_id"
    t.integer "sequence"
    t.boolean "enable", default: false
    t.index ["strength_testing_id", "slot_type", "attempts"], name: "index_testing_result_st_id_slot_type_attempts", unique: true
    t.index ["strength_testing_id"], name: "index_testing_results_on_strength_testing_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.integer "building_master_id"
    t.integer "project_master_id"
    t.integer "strength_testing_id"
    t.bigint "role_master_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "water_reducer_brands", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "water_reducer_types", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "water_reducer_brand_id", null: false
    t.index ["water_reducer_brand_id"], name: "index_water_reducer_types_on_water_reducer_brand_id"
  end

  create_table "zone_masters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "building_masters", "project_masters"
  add_foreign_key "building_masters", "users"
  add_foreign_key "cement_types", "cement_brands"
  add_foreign_key "concrete_mix_design_rmcs", "acceptance_strengths"
  add_foreign_key "concrete_mix_design_rmcs", "building_masters"
  add_foreign_key "concrete_mix_design_rmcs", "cements"
  add_foreign_key "concrete_mix_design_rmcs", "contractor_masters"
  add_foreign_key "concrete_mix_design_rmcs", "grade_masters"
  add_foreign_key "concrete_mix_design_rmcs", "project_masters"
  add_foreign_key "concrete_mix_design_rmcs", "rmc_lists"
  add_foreign_key "concrete_mix_design_rmcs", "structure_masters"
  add_foreign_key "concrete_mix_design_rmcs", "superplasticizers"
  add_foreign_key "concrete_mix_design_sites", "acceptance_strengths"
  add_foreign_key "concrete_mix_design_sites", "building_masters"
  add_foreign_key "concrete_mix_design_sites", "cements"
  add_foreign_key "concrete_mix_design_sites", "contractor_masters"
  add_foreign_key "concrete_mix_design_sites", "grade_masters"
  add_foreign_key "concrete_mix_design_sites", "project_masters"
  add_foreign_key "concrete_mix_design_sites", "superplasticizers"
  add_foreign_key "daily_testings", "strength_testings"
  add_foreign_key "day15_acceptances", "grade_masters"
  add_foreign_key "day28_acceptances", "grade_masters"
  add_foreign_key "day3_acceptances", "grade_masters"
  add_foreign_key "day5_acceptances", "grade_masters"
  add_foreign_key "day7_acceptances", "grade_masters"
  add_foreign_key "mix_designs", "recipes"
  add_foreign_key "mix_strengthand_structures", "acceptance_strengths"
  add_foreign_key "mix_strengthand_structures", "structure_masters"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipes", "cements"
  add_foreign_key "recipes", "m_admixtures"
  add_foreign_key "recipes", "m_silicas"
  add_foreign_key "recipes", "superplasticizers"
  add_foreign_key "strength_testings", "rmc_lists"
  add_foreign_key "structure_types", "mix_designs"
  add_foreign_key "superplasticizer_types", "superplasticizer_brands"
  add_foreign_key "testing_results", "strength_testings"
  add_foreign_key "water_reducer_types", "water_reducer_brands"
end
