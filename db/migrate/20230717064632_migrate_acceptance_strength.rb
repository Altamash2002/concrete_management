class MigrateAcceptanceStrength < ActiveRecord::Migration[7.0]
  def change
    add_column :acceptance_strengths, :testing_day_master_id, :bigint
    add_column :acceptance_strengths, :structure_master_id, :bigint

    group1 = { structure: ["Footing", "Raft Slab", "Raft Beam", "Pile", "Pile Cap", "Retaining Wall", "Mivan Slab", "Starter"], testing_days: ["2 days", "7 days", "15 days", "28 days"]}
    group2 = { structure: ["Plint Beam"], testing_days: ["2 days", "7 days", "15 days", "28 days", "56 days"]}
    group3 = { structure: ["Ordinary Slab", "Beam", "Staircase"], testing_days: ["2 days", "5 days", "15 days", "28 days"]}
    group4 = { structure: ["Flat Slab"], testing_days: ["2 days", "5 days", "15 days", "28 days"]}
    group5 = { structure: ["Shear walls", "Column"], testing_days: ["2 days", "3 days", "15 days", "28 days"]}
    group6 = { structure: ["VDF (without dewatering)", "UTWT", "Concrete Roads", "Laseer Screeds"], testing_days: ["7 days", "28 days"]}

    groups = { group1: group1, group2: group2, group3: group3, group4: group4, group5: group5, group6: group6 }

    groups.each do |key, group_data|
      group_data[:structure].each do |structure|
        structure_master = StructureMaster.find_by(name: structure)
        group_data[:testing_days].each do |testing_day|
          testing_day_master = TestingDayMaster.find_by(day: testing_day)
          AcceptanceStrength.create!(testing_day_master_id: testing_day_master&.id, structure_master_id: structure_master&.id, title: testing_day_master&.day)
        end
      end
    end
  end
end
