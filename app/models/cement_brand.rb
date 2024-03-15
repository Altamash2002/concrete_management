class CementBrand < ApplicationRecord
    # has_many :cement_types    
    self.table_name_prefix = 'hidden_'
end
