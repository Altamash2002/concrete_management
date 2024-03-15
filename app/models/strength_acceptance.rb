class StrengthAcceptance < ApplicationRecord

    # has_many :strength_testings

    def custom_label_method
        "#{grade}-#{day}"
    end
end
