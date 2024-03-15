class CementType < ApplicationRecord
    # belongs_to :cement_brand
    self.table_name_prefix = 'hidden_'
end
