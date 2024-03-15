class StandardDeviationController < ApplicationController
  def index 
    @buildings = BuildingMaster.all.select(:id, :name)

    @testing_results = TestingResult.order(created_at: :desc).limit(10)
    result_values = @testing_results.pluck(:result_value)

    # Calculate the average value
    valid_values = result_values.compact.select { |value| value.is_a?(Numeric) }

    # Calculate the average value
    @average_value = valid_values.sum.to_f / valid_values.size

    # Calculate the standard deviation
    sum_of_squares = valid_values.map { |value| (value - @average_value)**2 }.sum
    @standard_deviation = Math.sqrt(sum_of_squares / valid_values.size)

  end 
  def grade
    @buildings = BuildingMaster.all.select(:id, :name)
    @grades = GradeMaster.all
  end

  def standard
    @cement_names = Cement.pluck(:brand)
    @rmcs = RmcList.where(is_rmc: true).pluck(:name)
    @cement_dosages = StrengthTesting.pluck('cement_c_c_kg_m3').compact.uniq

    building_id = params[:building_id]
    grade_id = params[:grade_id]
    if building_id.present? && grade_id.present?
      @testing_results = TestingResult.joins(:strength_testing)
                                      .where(slot_type: '28 days', strength_testings: { building_master_id: building_id, grade_master_id: grade_id })
                                      .group(:strength_testing_id)
                                      .select('testing_results.strength_testing_id, AVG(testing_results.result_value / 10) AS result_value')
                                      .limit(30)
    else
       @testing_results = TestingResult.order(created_at: :desc).limit(30)
      
    end
    @testing_results_by_rmc = @testing_results.group_by { |result| result.strength_testing.rmc_list.name }
    result_values = @testing_results.map(&:result_value)
    @average_value = result_values.compact.sum.to_f / result_values.compact.size if result_values.present?

    # Calculate standard deviation as before
    if result_values.present?
      @average_value = result_values.compact.sum.to_f / result_values.compact.size
    else
      @average_value = 0.0  # Set a default value or handle this case as needed
    end
    # Calculate average result by RMC name
    @average_results_by_rmc = @testing_results.group_by { |result| result.strength_testing.rmc_list.name }
                                          .transform_values do |results|
                                            result_values = results.map(&:result_value)
                                            if result_values.present?
                                              result_values.compact.sum.to_f / result_values.compact.size
                                            else
                                              0 # Set a default value or handle this case as needed
                                            end
                                          end
    @standard_deviation_by_rmc = @testing_results.group_by { |result| result.strength_testing.rmc_list.name }
                                          .transform_values do |results|
                                            avg = @average_results_by_rmc[results.first.strength_testing.rmc_list.name]
                                            result_values = results.map(&:result_value).compact
                                            
                                            if avg.present? && result_values.present?
                                              sum_of_squares = result_values.map { |value| (value - avg)**2 }.sum
                                              Math.sqrt(sum_of_squares / result_values.size)
                                            else
                                              0  # Set a default value or handle this case as needed
                                            end
                                          end
                                          

    @grade_name = params[:grade_name]
    @grade_thresholds = StandardDeviation.find_by(grade: @grade_name) 
    @standard_deviation_result = if @grade_thresholds.present?
                                    if @standard_deviation.present? && @standard_deviation <= @grade_thresholds.v_good
                                      " "
                                    elsif @standard_deviation.present? && @standard_deviation <= @grade_thresholds.good
                                      " "
                                    elsif @standard_deviation.present? && @standard_deviation <= @grade_thresholds.fair
                                      ""
                                    else
                                      " "
                                    end
                                  else
                                    "Threshold data not found for the selected grade."
                                  end
                                 @sd_data = {
                                  labels: @average_results_by_rmc.keys,
                                  datasets: [
                                    {
                                      label: @standard_deviation_result,
                                      data: @standard_deviation_by_rmc.values,
                                      backgroundColor: set_background_colors(@standard_deviation_by_rmc.values),
                                       borderWidth: 0
                                    }
                                  ]
                                }.to_json

    @grades = GradeMaster.pluck(:name)
    @buildings = BuildingMaster.pluck(:name)
    respond_to do |format|
        format.html
        format.turbo_stream
    end
  end


  def standard_get_filter

    building_name = params["building_name"]
    grade_name = params["grade_name"]
    building_id = BuildingMaster.find_by(name: building_name)&.id
    grade_id = GradeMaster.find_by(name: grade_name)&.id
    @testing_results = TestingResult.order(created_at: :desc).limit(30)
    if building_name.present? && grade_name.present?
      @testing_results = TestingResult.joins(:strength_testing)
                                        .where(slot_type: '28 days', strength_testings: { building_master_id: building_id, grade_master_id: grade_id })
                                        .group(:strength_testing_id)
                                        .select('testing_results.strength_testing_id, AVG(testing_results.result_value /10) AS result_value')
                                        .limit(30)
    end

    @testing_results_by_rmc = @testing_results.group_by { |result| result.strength_testing.rmc_list.name }
    result_values = @testing_results.map(&:result_value)
    @average_value = result_values.compact.sum.to_f / result_values.compact.size if result_values.present?

    # Calculate standard deviation as before
    if result_values.present?
      sum_of_squares = result_values.map do |value|
        if value.present? && @average_value.present?
          (value - @average_value)**2
        else
          0  # Set a default value or handle this case as needed
        end
      end.sum
      @standard_deviation = Math.sqrt(sum_of_squares / result_values.size)
    else
      @standard_deviation = nil
    end

    # Calculate average result by RMC name
    @average_results_by_rmc = @testing_results.group_by { |result| result.strength_testing.rmc_list.name }
                                              .transform_values { |results| results.map(&:result_value).compact.sum.to_f / results.compact.size }

    @standard_deviation_by_rmc = @testing_results.group_by { |result| result.strength_testing.rmc_list.name }
                                              .transform_values do |results|
                                                avg = @average_results_by_rmc[results.first.strength_testing.rmc_list.name]
                                                result_values = results.map(&:result_value).compact

                                                if avg.present? && result_values.present?
                                                  deviations = result_values.map do |value|
                                                    diff = value - avg
                                                    diff**2 if diff.present?
                                                  end.compact

                                                  sum_of_deviations = deviations.sum
                                                  mean_of_deviations = sum_of_deviations / deviations.size

                                                  Math.sqrt(mean_of_deviations)
                                                else
                                                  nil
                                                end
                                              end

    @grade_name = params[:grade_name]
    @grade_thresholds = StandardDeviation.find_by(grade: @grade_name) 
    @standard_deviation_result = if @grade_thresholds.present?
                                  if @standard_deviation.present? && @standard_deviation <= @grade_thresholds.v_good
                                    " "
                                  elsif @standard_deviation.present? && @standard_deviation <= @grade_thresholds.good
                                    " "
                                  elsif @standard_deviation.present? && @standard_deviation <= @grade_thresholds.fair
                                    " "
                                  else
                                    " "
                                  end
                                else
                                  "Threshold data not found for the selected grade."
                                end
                                @background_colors = set_background_colors(@standard_deviation_by_rmc.values)            
    @sd_data = {
      labels: @average_results_by_rmc.keys,
      datasets: [
        {
          label: "",
          data: @standard_deviation_by_rmc.values,
          backgroundColor: set_background_colors(@standard_deviation_by_rmc.values),
          borderColor: 'rgba(255, 99, 132, 1)',
          borderWidth: 0
        }
      ]
    }.to_json

    @grades = GradeMaster.pluck(:name)
    @buildings = BuildingMaster.pluck(:name)
    respond_to do |format|
        format.html
        format.turbo_stream
    end
  end
  
  private
  def set_background_colors(standard_deviation_results)
    return [] if @grade_thresholds.nil?
  
    standard_deviation_results.map do |result|
      case result
      when 0..@grade_thresholds.v_good
        'rgba(77, 220, 109)' # Green for V. Good
      when (@grade_thresholds.v_good + 0.1)..@grade_thresholds.good
        'rgba(82, 130, 255)' # Blue for Good
      when (@grade_thresholds.good + 0.1)..@grade_thresholds.fair
        'rgba(255, 183, 62)' # Yellow for Fair
      else
        'rgba(246, 82, 82)' # Red for Poor
      end
    end
  end
   
end
  