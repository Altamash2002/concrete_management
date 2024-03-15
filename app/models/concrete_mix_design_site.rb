class ConcreteMixDesignSite < ApplicationRecord
  # belongs_to :project_master
  # belongs_to :building_master
  # belongs_to :contractor_master
  # belongs_to :acceptance_strength
  # belongs_to :grade_master
  # belongs_to :cement
  # belongs_to :superplasticizer
  self.table_name_prefix = 'hidden_'
end
