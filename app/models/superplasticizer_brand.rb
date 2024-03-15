class SuperplasticizerBrand < ApplicationRecord
    # has_many :superplasticizer_types
    self.table_name_prefix = 'hidden_'
end
