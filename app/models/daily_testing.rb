class DailyTesting < ApplicationRecord
  belongs_to :strength_testing
  # belongs_to :building, class_name: 'BuildingMaster', foreign_key: 'building_master_id'
end
