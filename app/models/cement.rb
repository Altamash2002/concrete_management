class Cement < ApplicationRecord

    def custom_label_method
        "#{brand}"
    end
end
