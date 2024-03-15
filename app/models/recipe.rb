class Recipe < ApplicationRecord
    # belongs_to :cement
    # belongs_to :m_admixture
    # belongs_to :m_silica
    # belongs_to :superplasticizer
    self.table_name_prefix = 'hidden_'
end
