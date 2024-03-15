class LandingController < ApplicationController
  helper_method :calculate_average
  def index
  end
  def mastergraph

    structure_name = params["structure_name"]
    building_name = params["building_name"]
    grade_name = params["grade_name"]
    cement_name = params["cement"]
    rmc_name = params["rmcc"]
    limit = params["limit"]

    from_date = Date.parse(params["from_date"]) if params["from_date"].present?
    to_date = Date.parse(params["to_date"]) if params["to_date"].present?

    # if current_user.site_incharge?
    #   building_ids = current_user.building_masters
    #   if building_ids.present?
    #    @strength_testings = StrengthTesting.all.order(:date)
    #   else
    #     @strength_testings = StrengthTesting.all.order(:date)
    #   end 
    # end
    if current_user.site_incharge?
      building_ids = current_user.building_masters
      if building_ids.present?
        @strength_testings = StrengthTesting.where(building_master: building_ids).order(:date)
      else
        @strength_testings = StrengthTesting.none # No buildings assigned, return an empty result
      end 
    elsif current_user.project_incharge?
      project_ids = current_user.project_master_id
       if project_ids.present?
        @strength_testings = StrengthTesting.where(project_masters: project_ids).order(:date)
       else
        @strength_testings = StrengthTesting.none # No buildings assigned, return an empty result
       end
    else
      @strength_testings = StrengthTesting.all.order(:date)
    end
    

    @strength_testings = StrengthTesting.where(is_verified: true).order(:date)
    # this is verification and validation line 
    if structure_name.present?
      @strength_testings = @strength_testings.where(structure_master: StructureMaster.where(name: structure_name))
    end

    if limit.present?
      @strength_testings = @strength_testings.limit(limit)
    end


    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if cement_name.present?
      @strength_testings = @strength_testings.where(cement: Cement.where(brand: cement_name))
    end

    if rmc_name.present?
      @strength_testings = @strength_testings.where(rmc_list: RmcList.where(name: rmc_name))
    end

  
    if grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: grade_name))
      @annotation = {
        annotations: [{
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.where(grade: grade_name, day: '3 days').pluck(:value), 
          borderColor: '#2E304F',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '3 days').pluck(:value),
            display: true,
            position: 'end',
            backgroundColor: 'transparent',
            color: 'black'
          }
        },
        {
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.all.where(grade: grade_name , day: '15 days').pluck(:value), 
          borderColor: '#5282FF',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '15 days').pluck(:value),
            display: true,
            position: 'end',
            backgroundColor: 'transparent',
            color: 'black'
          }
        },
        {
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.all.where(grade: grade_name , day: '28 days').pluck(:value), 
          borderColor: '#FFB73E',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '28 days').pluck(:value),
            display: true,
            position: 'end',
            backgroundColor: 'transparent',
            color: 'black'
          }
        }]
      }.to_json
    end

    if from_date.present? and !to_date.present?
      @strength_testings = @strength_testings.where('date >= ?', from_date)
    elsif !from_date.present? and to_date.present?
      @strength_testings = @strength_testings.where('date <= ?', to_date)
    elsif from_date.present? and to_date.present?
      @strength_testings = @strength_testings.where('date between (?) and (?)', from_date, to_date)
    end

    structure_id = params[:structure_id]
    building_id = params[:building_id]
    grade_id = params[:grade_id]

    d_structure_name = StructureMaster.find_by(id: structure_id)&.name
    d_building_name = BuildingMaster.find_by(id: building_id)&.name
    d_grade_name = GradeMaster.find_by(id: grade_id)&.name
    # strength testing drill down filter
    if d_structure_name.present?
      @strength_testings = @strength_testings.where(structure_master: StructureMaster.where(name: d_structure_name))
    end
    if d_building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: d_building_name))
    end
    if d_grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: d_grade_name))
      @annotation = {
        annotations: [{
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.where(grade: d_grade_name, day: '3 days').pluck(:value), 
          borderColor: '#2E304F',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '3 days').pluck(:value),
            display: true,
            position: 'end',
            backgroundColor: 'transparent',
            color: 'black'
          }
        },
        {
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.all.where(grade: d_grade_name , day: '15 days').pluck(:value), 
          borderColor: '#5282FF',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '16 days').pluck(:value),
            display: true,
            position: 'end',
            backgroundColor: 'transparent',
            color: 'black'
          }
        },
        {
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.all.where(grade: d_grade_name , day: '28 days').pluck(:value), 
          borderColor: '#FFB73E',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '28 days').pluck(:value),
            display: true,
            position: 'end',
            backgroundColor: 'transparent',
            color: 'black'
          }
        }]
      }.to_json
    end    
    
    labels = @strength_testings.pluck(:date).map { |date| date&.strftime("%d/%m/%Y") }.uniq
    datasets = []
    slot_types = ["3 days", "15 days", "28 days"]
    colors = ['#2E304F', '#5282FF', '#FFB73E']
    slot_types.each_with_index do |slot_type, index|
      color = colors[index % colors.length] # Use modulus to wrap around the colors array
      dataset = {
        label: slot_type,
        data: [],
        backgroundColor: color,
        borderColor: color,
        borderWidth: 1  
      }

      labels.each do |day|
        result_values = @strength_testings.where(date: day).map do |strength_testing|
          calculate_average(strength_testing.testing_results, slot_type, 0)
        end
        
        count = result_values.count { |value| value != 0 }
        average = count.zero? ? 0 : result_values.compact.sum / count.round
        dataset[:data] << average
      end
    
      datasets << dataset
    end

    chart_data = {
      labels: labels.map do |date|
        rmc_list_names = RmcList.where(id: @strength_testings
                        .where(date: date)
                        .pluck(:rmc_list_id).compact.uniq).pluck(:name)
                        .join("\n,\n")
        
        "#{date} \n (#{rmc_list_names})"
      end,
      datasets: datasets
    }

    @concrete_strength_project_building_grade = chart_data.to_json

     # Save the IDs in params
    # params[:building_id] = @building_id
    # params[:structure_id] = @structure_id
    # params[:grade_id] = @grade_id

      
    @structures = StructureMaster.distinct.pluck(:name)
    @grades = GradeMaster.pluck(:name)
    @buildings = BuildingMaster.pluck(:name)
    @cements = Cement.pluck(:brand)
    @rmcs = RmcList.pluck(:name)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
  
  def masterview
    green_values = StrengthTesting.where(is_green: true).count
    green_ids = StrengthTesting.where(is_green: true).pluck(:id)

    grey_values = StrengthTesting.where(is_gray: true, is_red: false, is_green: false).count

    red_values = StrengthTesting.where(is_red: true).where.not(id: green_ids).count 
    @zone_data = {
            labels: ['grey', 'red', 'green'],
            datasets: [{
              data: [grey_values, red_values, green_values],
              backgroundColor: ['#9E9E9E', '#ED2025', '#42A85D'],
              hoverBackgroundColor: ['#9E9E9E', '#ED2025', '#42A85D']
            }]
    }.to_json
  end
  
  def compressive
  end

  def concrete_strength_filter 
  end

  private
    def calculate_average(testing_results, slot_type, attempts)
      result_values = [
        get_result_value(testing_results, slot_type, attempts).to_i,
        get_result_value(testing_results, slot_type, attempts + 1).to_i,
        get_result_value(testing_results, slot_type, attempts + 2).to_i,
        get_result_value(testing_results, slot_type, attempts + 3).to_i
      ].reject { |value| value == 0 } # Exclude values of 0 from the array

      if result_values.empty?
        return 0 # Return 0 if there are no valid result values
      end
      
      average = result_values.sum.to_f / result_values.size
      average.round
    end

    def get_result_value(testing_results, slot_type, attempts)
      result = testing_results&.find_by(slot_type: slot_type, attempts: attempts)&.result_value
      result || 0
    end

end
