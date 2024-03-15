class WaterReducerType < ApplicationRecord
    # belongs_to :water_reducer_brand
    self.table_name_prefix = 'hidden_'
end
