class StructureType < ApplicationRecord
    # belongs_to :mix_design
    self.table_name_prefix = 'hidden_'
end
