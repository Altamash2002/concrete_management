class TestingResult < ApplicationRecord
    belongs_to :strength_testing
    belongs_to :user, optional: true

    # after_update :check_if_failed_and_enable_next_test

    def is_failed?(slot_type)
      grade_master = strength_testing.grade_master
      accepeted_value = StrengthAcceptance.find_by(grade_master_id: grade_master.id, day: slot_type)&.value
    
    end

    def check_if_failed_and_enable_next_test(slot_type)
      if is_red?
        strength_testing.enable_next_test
      end
    end
end
