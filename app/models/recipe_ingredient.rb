class RecipeIngredient < ApplicationRecord
    # belongs_to :recipe
    self.table_name_prefix = 'hidden_'
end
