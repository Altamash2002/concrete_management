class MixDesign < ApplicationRecord
    # belongs_to :recipe
    # has_one :structure_type
    self.table_name_prefix = 'hidden_'
end
