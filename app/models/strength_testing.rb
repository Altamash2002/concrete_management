# frozen_string_literal: true

class StrengthTesting < ApplicationRecord # rubocop:disable Style/Documentation
  has_many :testing_results, dependent: :destroy
  belongs_to :project_master, optional: true
  belongs_to :building_master, optional: true
  belongs_to :structure_master, optional: true
  # belongs_to :concrete
  belongs_to :grade_master, optional: true
  belongs_to :user

  belongs_to :strength_acceptance, optional: true

  belongs_to :cement, optional: true
  belongs_to :superplasticizer, foreign_key: 's_plasticizer_id',optional: true 
  belongs_to :m_admixture, optional: true
  belongs_to :m_silica, optional: true
  # belongs_to :recipe
  # belongs_to :zone_master
 
  belongs_to :num_of_cube, class_name: 'NumOfCube', foreign_key: 'num_of_cubes_id', optional: true
  belongs_to :rmc_list, optional: true
  # has_many :users
  has_many :daily_testings, dependent: :destroy

  accepts_nested_attributes_for :testing_results, allow_destroy: true
  # after_commit :send_emails, on: %i[create update]
 
  # Create a function to update is gray if test fails
  def check_and_set_gray
    if grey_zone? || grey_zone_fifteen?
      update(is_gray: true)
    else
      update(is_gray: false)
    end

    if testing_results.exists?(slot_type: '28 days', result_value: 1..Float::INFINITY)
      update(is_gray: false)
    end
    
  end 
  

  def check_and_set_red
    if red_zone?
      update(is_red: true)
    else
      update(is_red: false)
    end
  end

  def check_and_set_green
    if green_zone?
      update(is_green: true)
    else
      update(is_green: false)
    end
  end

  def grey_zone? # rubocop:disable Metrics/MethodLength
    test_days = ['2 days', '3 days', '5 days', '7 days', '10 days', '14 days']
    test_days.each do |test_day|
      filtered_results = testing_results.where(slot_type: test_day, attempts: 0..3).where.not(result_value: 0)
    
      # Calculate the average of the filtered results
      # average_result = filtered_results.average(:result_value)
      # grey_threshold_val = if ['5 days', '7 days'].include?(test_day)
      #                        fs_grey_threshold(structure_master.name)
      #                      else
      #                        grey_threshold(test_day)
      #                      end
      average_result = filtered_results.average(:result_value)
      grey_threshold_val = if ['5 days', '7 days'].include?(test_day)
                       structure_name = structure_master&.name
                       fs_grey_threshold(structure_name)
                     else
                       grey_threshold(test_day)
                     end

      # p "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      # p "Test Day: #{test_day} - #{average_result} < #{grey_threshold_val}"
      # p "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      return true if average_result && grey_threshold_val && average_result < grey_threshold_val && average_result != 0
    end
    false
  end

  def grey_zone_fifteen?
    test_day = '15 days'
    filtered_results = testing_results.where(slot_type: test_day, attempts: 0..3).where.not(result_value: 0)
  
    # Calculate the average of the filtered results
    average_result = filtered_results.average(:result_value)
    grey_threshold_val = grey_threshold(test_day)
    # p "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    # p "Test Day: #{test_day} - #{average_result} < #{grey_threshold_val}"
    # p "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    return true if average_result && grey_threshold_val && average_result < grey_threshold_val && average_result != 0

    false
  end

  def red_zone?
    test_day = '28 days'
    filtered_results = testing_results.where(slot_type: test_day, attempts: 0..3).where.not(result_value: 0)
  
    # Calculate the average of the filtered results
    average_result = filtered_results.average(:result_value)
    red_threshold_val = red_threshold
    # p "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    # p "Test Day: #{test_day} - #{average_result} < #{red_threshold_val}"
    # p "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    return true if average_result && red_threshold_val && average_result < red_threshold_val && average_result != 0

    false
  end

  def green_zone?
    test_days = ['35 days', '45 days', '56 days', '90 days', '120 days']
    test_days.each do |test_day|
      filtered_results = testing_results.where(slot_type: test_day, attempts: 0..3).where.not(result_value: 0)
    
      # Calculate the average of the filtered results
      average_result = filtered_results.average(:result_value)
      green_threshold_val = red_threshold
      # p "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      # p "Test Day: #{test_day} - #{average_result} < #{green_threshold_val}"
      # p "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      return true if average_result && green_threshold_val && average_result >= green_threshold_val
    end
    false
  end

  def is_accepted_strength?(testing_day)
    structure_master&.acceptance_strengths.pluck(:title).include?(testing_day)
    
  end 

  def enable_testing_days
    if structure_master
      allowed_days = structure_master.acceptance_strengths.pluck(:title)
      allowed_days.each do |day|
        testing_result = testing_results.find_or_create_by(slot_type: day)
        testing_result.update(enable: true)
      end
      testing_results.where.not(slot_type: allowed_days).update_all(enable: false)
    else
      # Handle the case where structure_master is nil or not found
      # You may want to raise an error or handle it differently based on your application's requirements.
    end
  end
  

  def create_daily_testings
    if structure_master
      allowed_days = structure_master&.acceptance_strengths.pluck(:title)
      date = self.date
      allowed_days.each do |day|
        next_day = date + day.to_i.days
        DailyTesting.create(strength_testing_id: id, date: next_day, slot_type: day)
      end
    else
    end
  end
  
  def update_daily_testings
    if structure_master
      allowed_days = structure_master&.acceptance_strengths.pluck(:title)
      date = self.date
      
      self.daily_testings.where.not(slot_type: allowed_days).destroy_all

      # Loop through allowed_days and update/create DailyTesting records accordingly
      allowed_days.each do |day|
        next_day = date + day.to_i.days
        daily_testing = DailyTesting.find_by(strength_testing_id: id, slot_type: day)

        if daily_testing
          daily_testing.update(date: next_day)
        else
          DailyTesting.create(strength_testing_id: id, date: next_day, slot_type: day)
        end
      end
    else
    end
  end

  def current_testing_day
    daily_testings.where(date: [Date.yesterday, Date.today])&.first
  end

  def check_if_failed_and_enable_next_test
    testing_results.where(enable: true).group_by(&:slot_type).each do |slot_type, results|
      average_result_value = results.map(&:result_value).compact.sum.fdiv(results.size.nonzero? || 1)
      if average_result_value > 0
        accepeted_value = StrengthAcceptance.find_by(grade: grade_master&.name, day: slot_type)&.value || 0
        if average_result_value < accepeted_value
          test_day = TestingDayMaster.find_by(title: slot_type)
          return if test_day.nil?

          next_test_day = TestingDayMaster.find_by(sequence: test_day.sequence + 1)&.day
          return if next_test_day.nil?

          next_day = date + next_test_day.to_i.days
          testing_results.where(slot_type: next_test_day).update_all(enable: true)
          DailyTesting.create(strength_testing_id: id, date: next_day, slot_type: next_test_day)
        end
      end
    end
  end

  private

  # def send_emails
  #   if grey_zone?
  #     UserMailer.grey_values_email(User.last, [self]).deliver_later
  #   elsif red_zone?
  #     UserMailer.red_values_email(User.last, [self]).deliver_later
  #   end
  # end

  def send_emails
    if grey_zone?
      UserMailer.grey_values_email(User.last, [self]).deliver_later
    elsif red_zone?
      green_values = # Logic to initialize @green_values here
      UserMailer.red_values_email(User.last, [self], green_values).deliver_later
    end
  end 

  def send_email
    # Logic to fetch the data you want to send via email
    @red_values = StrengthTesting.where(is_red: true)
  
    # Send the email
    UserMailer.red_values_email(current_user, @red_values, []).deliver_now
  
    redirect_to red_values_path, notice: 'Data sent via email successfully!'
  end

  def send_email
    # Logic to fetch the data you want to send via email
    @grey_values = StrengthTesting.where(is_grey: true)
  
    # Send the email
    UserMailer.grey_values_email(current_user, @grey_values, []).deliver_now
  
    redirect_to grey_values_path, notice: 'Data sent via email successfully!'
  end


  # def red_zone?
  #   # Logic to determine if the strength testing is in the red zone
  #   # Modify this condition based on your specific requirements
  #   # Return true if it's in the red zone, false otherwise
  #   # For example:
  #   average_result = testing_results.where(slot_type: '28 days', attempts: 0..3)&.average(:result_value)

  #   # Check if the average result value is not nil and less than the grey threshold
  #   if average_result && average_result < red_threshold
  #     return true
  #   else
  #     return false
  #   end
  # end

  # def grey_zone_old?
  #   # Calculate the average result value for the specified slot types and attempts
  #   average_result = testing_results.where(slot_type: ['3 days', '5 days', '7 days', '15 days'], attempts: 0..3)
  #                                    .average(:result_value)
  #   # Check if the average result value is not nil and less than the grey threshold
  #   if average_result && average_result < grey_threshold
  #     return true
  #   else
  #     return false
  #   end
  # end

  def red_threshold
    # Retrieve the red threshold value from the strength_acceptances table or define it as needed
    # Modify this based on your specific implementation
    # Example:
    if grade_master.present?
      StrengthAcceptance.find_by(grade: grade_master.name, day: '28 days')&.value || 0
    else  
    end
  end

  def grey_threshold(test_day)
    # Retrieve the grey threshold value from the strength_acceptances table or define it as needed
    # Modify this based on your specific implementation
    # Example:
    if grade_master.present?
    StrengthAcceptance.find_by(grade: grade_master.name, day: test_day)&.value || 0
    else  
    end
  end

  def fs_grey_threshold(structure)
    day_structure = StructureMaster&.find_by(name: structure)&.sp_strength
    if grade_master.present?
    StrengthAcceptance.find_by(grade: grade_master.name, day: day_structure)&.value || 0
    else  
    end
  end
end
