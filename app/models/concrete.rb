class Concrete < ApplicationRecord
    self.table_name_prefix = 'hidden_'
end
