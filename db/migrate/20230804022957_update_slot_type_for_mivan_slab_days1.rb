class UpdateSlotTypeForMivanSlabDays1 < ActiveRecord::Migration[7.0]
  def change
    TestingResult.joins(strength_testing: :structure_master).where(
      'structure_masters.name = ? AND testing_results.slot_type = ?',
      'Mivan Slab',
      '1 days'
    ).update_all(slot_type: '2 days')
  end
end
