class MixStrengthandStructure < ApplicationRecord
    belongs_to :structure_master
    belongs_to :acceptance_strength
    # self.table_name_prefix = 'hidden_'
end
