class SuperplasticizerType < ApplicationRecord
    # belongs_to :superplasticizer_brand
    self.table_name_prefix = 'hidden_'
end
