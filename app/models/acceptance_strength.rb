class AcceptanceStrength < ApplicationRecord
  # has_many :mix_strengthand_structures
  # has_many :structure_masters, through: :mix_strengthand_structures
  # self.table_name_prefix = 'hidden_'
  belongs_to :testing_day_master
  belongs_to :structure_master
end