class AddAdditionalAcceptanceStrengthData < ActiveRecord::Migration[7.0]
  def up
    group7 = { structure: ["Inverted Beam", "Toe", "Screed", "Tie beam", "Ramp Slab", "Grade slab", "Plinth beam", "Elevation", "PCC", "Tremix", "Pardi", "Parapit wall"], testing_days: ["1 days", "7 days", "15 days", "28 days"]}
    group8 = { structure: ["Lift pardi", "Share wall", "Non Structural wall", "Stater"], testing_days: ["1 days", "3 days", "15 days", "28 days", "56 days"]}
    group9 = { structure: ["Flat Slab", "Chajja", "Slab"], testing_days: ["1 days", "3 days", "5 days", "15 days", "28 days"]}
    group10 = { structure: ["PT Slab"], testing_days: ["1 days", "3 days", "15 days", "28 days"]}
    group11 = { structure: ["Mivan Slab"], testing_days: ["1 days", "2 days", "10 days", "14 days", "28 days"]}

    groups = {
      group7: group7,
      group8: group8,
      group9: group9,
      group10: group10,
      group11: group11
    }

   # Inside the migration
    groups.each do |key, group_data|
      group_data[:structure].each do |structure|
        structure_master = StructureMaster.find_or_create_by(name: structure) # Use find_or_create_by
        group_data[:testing_days].each do |testing_day|
          testing_day_master = TestingDayMaster.find_or_create_by(day: testing_day)
          AcceptanceStrength.create!(testing_day_master_id: testing_day_master&.id, structure_master_id: structure_master&.id, title: testing_day_master&.day)
        end
      end
    end
  end

  def down
    # You can implement the data removal logic here if needed
  end
end
