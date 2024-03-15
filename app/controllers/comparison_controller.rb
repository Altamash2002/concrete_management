class ComparisonController < ApplicationController
  helper_method :calculate_average

  def index
    @strength_testings = StrengthTesting.where(is_verified: true)
    # this is verification and validation line 
    structure_id = params[:structure_id]
    building_id = params[:building_id]
    grade_id = params[:grade_id]
    @buildings = BuildingMaster.pluck(:name)
    @rmcs = RmcList.where(is_rmc: false).pluck(:name)

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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value),
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
            content: StrengthAcceptance.where(grade: d_grade_name, day: '15 days').pluck(:value),
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
  
    labels = @strength_testings.pluck(:cement_id)
    cement_brands = []
    # for id in labels do
    #     cement = Cement.find_by(id: id)
    #     brand = cement.brand
    #     cement_brands.append(brand)
    # end
    # cement_brands = cement_brands.uniq
    for id in labels do
      cement = Cement.find_by(id: id)
      if cement
          brand = cement&.brand
          cement_brands.append(brand)
      end
    end
    cement_brands = cement_brands.compact
    original_counts = Hash.new(0)

    # Count the occurrences of each brand in the original array
    cement_brands.each { |brand| original_counts[brand] += 1 }

    cement_brands = cement_brands.uniq
    

    datasets = []
    slot_types = ["2 days", "3 days", "5 days", "7 days", "10 days","14 days", "15 days", "28 days"]
    colors = ['#FF5733', '#2E304F', '#4ddc6d', '#f65252', '#c1c1ff', '#9C27B0', '#5282FF', '#FFB73E']
    
    slot_types.each_with_index do |slot_type, index|
      color = colors[index % colors.length] # Use modulus to wrap around the colors array

      dataset = {
        label: slot_type,
        data: [],
        backgroundColor: color,
        borderColor: color,
        borderWidth: 1
      }
      cement_brands.each do |cbrand|
        result_values = @strength_testings.where(cement: Cement.where(brand: cbrand)).map do |strength_testing|
          calculate_average(strength_testing.testing_results, slot_type, 0)
        end

        count = result_values.count { |value| value != 0 }
        average = count.zero? ? 0 : result_values.compact.sum / count.round
        dataset[:data] << average
      end
      datasets << dataset
    end
    @cement_data = {
      labels: cement_brands.map { |cbrand| "#{cbrand} (#{original_counts[cbrand]})" },
      datasets: datasets
    }.to_json

    @grades = GradeMaster.pluck(:name)
    @structures = StructureMaster.pluck(:name)
    @cement_names = Cement.pluck(:brand)
    @cement_dosages = StrengthTesting.pluck('cement_c_c_kg_m3').compact.uniq
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
    
  def cement
    grade_name = params["grade_name"]
    cement = params["cement"]
    cdosage = params["cdosage"]
    building_name = params["building_name"]
    rmc_name = params["rmcc"]
    structure_name = params["structure_name"]

    @buildings = BuildingMaster.pluck(:name)
    @rmcs = RmcList.where(is_rmc: false).pluck(:name)
    from_date = Date.parse(params["from_date"]) if params["from_date"].present?
    to_date = Date.parse(params["to_date"]) if params["to_date"].present?

    if params["to_date"].present? && !params["from_date"].present?
      flash.now[:alert] = "Please select the 'From' date."
    end
    # puts "------------------------------"
    # puts params["grade_name"]
    # puts params
    # puts grade_name.present?
    # puts "------------------------------"
    @strength_testings = StrengthTesting.where(is_verified: true)
    # this is verification and validation line 
    if cement.present?
      @strength_testings = @strength_testings.where(cement: Cement.where(brand: cement))
    end

    if structure_name.present?
      @strength_testings = @strength_testings.where(structure_master: StructureMaster.where(name: structure_name))
    end

    if cdosage.present?
      @strength_testings = @strength_testings.where(cement_c_c_kg_m3: cdosage)
    end

    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if rmc_name.present?
      @strength_testings = @strength_testings.where(rmc_list: RmcList.where(is_rmc: false, name: rmc_name))
    end

    if grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: grade_name))
      @annotation = {
        annotations: [{
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value),
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
  
    labels = @strength_testings.pluck(:cement_id)
    cement_brands = []
    for id in labels do
        cement = Cement.find_by(id: id)
        brand = cement&.brand
        cement_brands.append(brand)
    end
    cement_brands = cement_brands.compact
    original_counts = Hash.new(0)

    # Count the occurrences of each brand in the original array
    cement_brands.each { |brand| original_counts[brand] += 1 }

    cement_brands = cement_brands.uniq
    

    datasets = []
    slot_types = ["2 days", "3 days", "5 days", "7 days", "10 days","14 days", "15 days", "28 days"]
    colors = ['#FF5733', '#2E304F', '#4ddc6d', '#f65252', '#c1c1ff', '#9C27B0', '#5282FF', '#FFB73E']
    
    slot_types.each_with_index do |slot_type, index|
      color = colors[index % colors.length] # Use modulus to wrap around the colors array

      dataset = {
        label: slot_type,
        data: [],
        backgroundColor: color,
        borderColor: color,
        borderWidth: 1
      }
      cement_brands.each do |cbrand|
        result_values = @strength_testings.where(cement: Cement.where(brand: cbrand)).map do |strength_testing|
          calculate_average(strength_testing.testing_results, slot_type, 0)
        end
        
        count = result_values.count { |value| value != 0 }
        average = count.zero? ? 0 : result_values.compact.sum / count.round
        dataset[:data] << average
      end
      datasets << dataset
    end
    @cement_data = {
      labels: cement_brands.map { |cbrand| "#{cbrand} (#{original_counts[cbrand]})" },
      datasets: datasets
    }.to_json

    # @grades = @strength_testings.pluck(:grade_master).uniq
    # @grades = @strength_testings.joins(:grade_master).pluck('grade_masters.id').uniq
    # @grades = @strength_testings.joins(:grade_master).pluck('grade_masters.id').uniq
    # @grades = StrengthTesting.joins(:grade_master).pluck('grade_masters.name').compact.uniq
 
    @grades = GradeMaster.pluck(:name)
    @structures = StructureMaster.pluck(:name)
    @cement_names = Cement.pluck(:brand)
    @cement_dosages = StrengthTesting.pluck('cement_c_c_kg_m3').compact.uniq
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
    

  def flyash
    grade_name = params["grade_name"]
    fly_ash = params["fly_ash"]
    cdosage = params["cdosage"]
    cement = params["cement"]
    building_name = params["building_name"]
    rmc_name = params["rmcc"]
    structure_name = params["structure_name"]

    @cement_names = Cement.pluck(:brand)
    @buildings = BuildingMaster.pluck(:name)
    @rmcs = RmcList.where(is_rmc: false).pluck(:name)

    from_date = Date.parse(params["from_date"]) if params["from_date"].present?
    to_date = Date.parse(params["to_date"]) if params["to_date"].present?

    # puts "------------------------------"
    # puts params["grade_name"]
    # puts params
    # puts grade_name.present?
    # puts "------------------------------"
    @strength_testings = StrengthTesting.where(is_verified: true)
    # this is verification and validation line 
    
    if cement.present?
      @strength_testings = @strength_testings.where(cement: Cement.where(brand: cement))
    end

    if structure_name.present?
      @strength_testings = @strength_testings.where(structure_master: StructureMaster.where(name: structure_name))
    end

    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if rmc_name.present?
      @strength_testings = @strength_testings.where(rmc_list: RmcList.where(is_rmc: false,name: rmc_name))
    end

    if fly_ash.present?
      @strength_testings = @strength_testings.where(m_admixture: MAdmixture.where(brand: fly_ash))
    end

    if cdosage.present?
      @strength_testings = @strength_testings.where(cement_c_c_kg_m3: cdosage)
    end

    if grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: grade_name))
      @annotation = {
        annotations: [{
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value),
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

    # flyash comparison drill down  filter
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value),
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
            content: StrengthAcceptance.where(grade: d_grade_name, day: '15 days').pluck(:value),
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
    
    labels = @strength_testings.pluck(:m_admixture_id)
    flyash = []
    for id in labels do
        f_ash = MAdmixture.find_by(id: id)
        brand = f_ash&.brand
        flyash.append(brand)
    end
    flyash = flyash.compact
    original_counts = Hash.new(0)

    # Count the occurrences of each brand in the original array
    flyash.each { |brand| original_counts[brand] += 1 }

    flyash = flyash.uniq

    datasets = []
    slot_types = ["2 days", "3 days", "5 days", "7 days", "10 days","14 days", "15 days", "28 days"]
    colors = ['#FF5733', '#2E304F', '#4ddc6d', '#f65252', '#c1c1ff', '#9C27B0', '#5282FF', '#FFB73E']
    
    slot_types.each_with_index do |slot_type, index|
      color = colors[index % colors.length] # Use modulus to wrap around the colors array

      dataset = {
        label: slot_type,
        data: [],
        backgroundColor: color,
        borderColor: color,
        borderWidth: 1
      }
      flyash.each do |fbrand|
        result_values = @strength_testings.where(m_admixture: MAdmixture.where(brand: fbrand)).map do |strength_testing|
          calculate_average(strength_testing.testing_results, slot_type, 0)
        end
        
        count = result_values.count { |value| value != 0 }
        average = count.zero? ? 0 : result_values.compact.sum / count.round
        dataset[:data] << average
      end
      datasets << dataset
    end
    @flyash_data = {
      labels: flyash.map do |fbrand|
        rmc_list_names = RmcList.where(id: @strength_testings
                        .where(m_admixture: MAdmixture.where(brand: fbrand))
                        .pluck(:rmc_list_id).compact.uniq).pluck(:name)
                        .join("\n,\n")
        
        "#{fbrand} (#{original_counts[fbrand]}) \n (#{rmc_list_names})"
      end,
      datasets: datasets
    }.to_json

    @grades = GradeMaster.pluck(:name)
    @structures = StructureMaster.pluck(:name)
    @flyashes = MAdmixture.pluck(:brand)
    @cement_dosages = StrengthTesting.pluck('cement_c_c_kg_m3').compact.uniq
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
  
  def micro_silica
    grade_name = params["grade_name"]
    silica = params["silica"]
    cdosage = params["cdosage"]
    cement = params["cement"]
    building_name = params["building_name"]
    rmc_name = params["rmcc"]
    structure_name = params["structure_name"]

    @cement_names = Cement.pluck(:brand)
    @buildings = BuildingMaster.pluck(:name)
    @rmcs = RmcList.pluck(:name)

    from_date = Date.parse(params["from_date"]) if params["from_date"].present?
    to_date = Date.parse(params["to_date"]) if params["to_date"].present?

    # puts "------------------------------"
    # puts params["grade_name"]
    # puts params
    # puts grade_name.present?
    # puts "------------------------------"
    @strength_testings = StrengthTesting.where(is_verified: true)
    # this is verification and validation line 
    
    if cement.present?
      @strength_testings = @strength_testings.where(cement: Cement.where(brand: cement))
    end

    if structure_name.present?
      @strength_testings = @strength_testings.where(structure_master: StructureMaster.where(name: structure_name))
    end

    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if rmc_name.present?
      @strength_testings = @strength_testings.where(rmc_list: RmcList.where(name: rmc_name))
    end

    if silica.present? 
      @strength_testings = @strength_testings.where(m_silica: MSilica.where(brand: silica))
    end

    if cdosage.present?
      @strength_testings = @strength_testings.where(cement_c_c_kg_m3: cdosage)
    end

    if grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: grade_name))
      @annotation = {
        annotations: [{
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value),
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

    # m_silica comparison drill down filter
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value),
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
            content: StrengthAcceptance.where(grade: d_grade_name, day: '15 days').pluck(:value),
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
    
    labels = @strength_testings.pluck(:m_silica_id)
    silica = []
    for id in labels do
        m_sili = MSilica.find_by(id: id)
        brand = m_sili&.brand
        silica.append(brand)
    end
    silica = silica.compact
    original_counts = Hash.new(0)

    # Count the occurrences of each brand in the original array
    silica.each { |brand| original_counts[brand] += 1 }

    silica = silica.uniq

    datasets = []
    slot_types = ["2 days", "3 days", "5 days", "7 days", "10 days","14 days", "15 days", "28 days"]
    colors = ['#FF5733', '#2E304F', '#4ddc6d', '#f65252', '#c1c1ff', '#9C27B0', '#5282FF', '#FFB73E']
    
    slot_types.each_with_index do |slot_type, index|
      color = colors[index % colors.length] # Use modulus to wrap around the colors array

      dataset = {
        label: slot_type,
        data: [],
        backgroundColor: color,
        borderColor: color,
        borderWidth: 1
      }
      silica.each do |mbrand|
        result_values = @strength_testings.where(m_silica: MSilica.where(brand: mbrand)).map do |strength_testing|
          calculate_average(strength_testing.testing_results, slot_type, 0)
        end
        
        count = result_values.count { |value| value != 0 }
        average = count.zero? ? 0 : result_values.compact.sum / count.round
        dataset[:data] << average
      end
      datasets << dataset
    end
    @msilica_data = {
      labels: silica.map { |sbrand| "#{sbrand} (#{original_counts[sbrand]})" },
      datasets: datasets
    }.to_json

    @grades = GradeMaster.pluck(:name)
    @structures = StructureMaster.pluck(:name)
    @silicas = MSilica.pluck(:brand)
    @cement_dosages = StrengthTesting.pluck('cement_c_c_kg_m3').compact.uniq
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def superplasticizer
    grade_name = params["grade_name"]
    superp = params["superp"]
    cdosage = params["cdosage"]
    cement = params["cement"]
    building_name = params["building_name"]
    rmc_name = params["rmcc"]
    structure_name = params["structure_name"]

    @cement_names = Cement.pluck(:brand)
    @buildings = BuildingMaster.pluck(:name)
    @rmcs = RmcList.pluck(:name)

    from_date = Date.parse(params["from_date"]) if params["from_date"].present?
    to_date = Date.parse(params["to_date"]) if params["to_date"].present?

    # puts "------------------------------"
    # puts params["grade_name"]
    # puts params
    # puts grade_name.present?
    # puts "------------------------------"
    @strength_testings = StrengthTesting.where(is_verified: true)
    # this is verification and validation line 

        
    if cement.present?
      @strength_testings = @strength_testings.where(cement: Cement.where(brand: cement))
    end

    if structure_name.present?
      @strength_testings = @strength_testings.where(structure_master: StructureMaster.where(name: structure_name))
    end

    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if rmc_name.present?
      @strength_testings = @strength_testings.where(rmc_list: RmcList.where(name: rmc_name))
    end

    if superp.present?
      @strength_testings = @strength_testings.where(superplasticizer: Superplasticizer.where(brand: superp))
    end

    if cdosage.present?
      @strength_testings = @strength_testings.where(cement_c_c_kg_m3: cdosage)
    end

    if grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: grade_name))
      @annotation = {
        annotations: [{
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value),
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

    # superplasticizer comparison drill down filter
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value),
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
            content: StrengthAcceptance.where(grade: d_grade_name, day: '15 days').pluck(:value),
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
    
    labels = @strength_testings.pluck(:s_plasticizer_id)
    s_plasticizer = []
    for id in labels do
        plasticizer = Superplasticizer.find_by(id: id)
        brand = plasticizer&.brand
        s_plasticizer.append(brand)
    end
    s_plasticizer = s_plasticizer.compact
    original_counts = Hash.new(0)

    # Count the occurrences of each brand in the original array
    s_plasticizer.each { |brand| original_counts[brand] += 1 }

    s_plasticizer = s_plasticizer.uniq

    
    datasets = []
    slot_types = ["2 days", "3 days", "5 days", "7 days", "10 days","14 days", "15 days", "28 days"]
    colors = ['#FF5733', '#2E304F', '#4ddc6d', '#f65252', '#c1c1ff', '#9C27B0', '#5282FF', '#FFB73E']
    
    slot_types.each_with_index do |slot_type, index|
      color = colors[index % colors.length] # Use modulus to wrap around the colors array

      dataset = {
        label: slot_type,
        data: [],
        backgroundColor: color,
        borderColor: color,
        borderWidth: 1
      }
      s_plasticizer.each do |sbrand|
        result_values = @strength_testings.where(superplasticizer: Superplasticizer.where(brand: sbrand)).map do |strength_testing|
          calculate_average(strength_testing.testing_results, slot_type, 0)
        end
        
        count = result_values.count { |value| value != 0 }
        average = count.zero? ? 0 : result_values.compact.sum / count.round
        dataset[:data] << average
      end
      datasets << dataset
    end
    @superplasticizer_data = {
      labels: s_plasticizer.map do |spbrand|
        rmc_list_names = RmcList.where(id: @strength_testings
                        .where(superplasticizer: Superplasticizer.where(brand: spbrand))
                        .pluck(:rmc_list_id).compact.uniq).pluck(:name)
                        .join("\n,\n")
        
        "#{spbrand} (#{original_counts[spbrand]}) \n (#{rmc_list_names})"
      end,
      datasets: datasets
    }.to_json

    @grades = GradeMaster.pluck(:name)
    @structures = StructureMaster.pluck(:name)
    @splasticizers = Superplasticizer.pluck(:brand)
    @cement_dosages = StrengthTesting.pluck('cement_c_c_kg_m3').compact.uniq
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def rmc_concrete
    grade_name = params["grade_name"]
    rmcc = params["rmcc"]
    cdosage = params["cdosage"]
    building_name = params["building_name"]
    structure_name = params["structure_name"]

    @buildings = BuildingMaster.pluck(:name)
    @rmcs = RmcList.where(is_rmc: true).pluck(:name)

    

    from_date = Date.parse(params["from_date"]) if params["from_date"].present?
    to_date = Date.parse(params["to_date"]) if params["to_date"].present?

    # puts "------------------------------"
    # puts params["grade_name"]
    # puts params
    # puts grade_name.present?
    # puts "------------------------------"
    @strength_testings = StrengthTesting.where(is_verified: true)
    # this is verification and validation line 

    if rmcc.present?
      @strength_testings = @strength_testings.where(rmc_list: RmcList.where(is_rmc: true, name: rmcc))
    end

    if structure_name.present?
      @strength_testings = @strength_testings.where(structure_master: StructureMaster.where(name: structure_name))
    end

    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if cdosage.present?
      @strength_testings = @strength_testings.where(cement_c_c_kg_m3: cdosage)
    end

    if grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: grade_name))
      @annotation = {
        annotations: [{
          type: 'line',
          mode: 'horizontal',
          scaleID: 'y',
          value: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: grade_name, day: '14 days').pluck(:value),
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

    # rmc comparison drill down filter
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value), 
          borderColor: '#FF5733',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '2 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value), 
          borderColor: '#4ddc6d',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '5 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value), 
          borderColor: '#f65252',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '7 days A').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '10 days').pluck(:value),
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
          value: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value), 
          borderColor: '#c1c1ff',
          borderWidth: 2,
          label: {
            content: StrengthAcceptance.where(grade: d_grade_name, day: '14 days').pluck(:value),
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
            content: StrengthAcceptance.where(grade: d_grade_name, day: '15 days').pluck(:value),
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
    
    labels = @strength_testings.pluck(:rmc_list_id)
    rmc = []
    for id in labels do
        r_concrete = RmcList.find_by(id: id)
        brand = r_concrete&.name
        rmc.append(brand)
    end
    rmc = rmc.compact
    original_counts = Hash.new(0)

    # Count the occurrences of each brand in the original array
    rmc.each { |brand| original_counts[brand] += 1 }

    rmc = rmc.uniq

    datasets = []
    slot_types = ["2 days", "3 days", "5 days", "7 days", "10 days","14 days", "15 days", "28 days"]
    colors = ['#FF5733', '#2E304F', '#4ddc6d', '#f65252', '#c1c1ff', '#9C27B0', '#5282FF', '#FFB73E']
    
    slot_types.each_with_index do |slot_type, index|
      color = colors[index % colors.length] # Use modulus to wrap around the colors array

      dataset = {
        label: slot_type,
        data: [],
        backgroundColor: color,
        borderColor: color,
        borderWidth: 1
      }
      rmc.each do |rname|
        result_values = @strength_testings.where(rmc_list: RmcList.where(is_rmc: true, name: rname)).map do |strength_testing|
          calculate_average(strength_testing.testing_results, slot_type, 0)
        end
        
        count = result_values.count { |value| value != 0 }
        average = count.zero? ? 0 : result_values.compact.sum / count.round
        dataset[:data] << average
      end
      datasets << dataset
    end
    @rmc_concrete_data = {
      labels: rmc.map { |rbrand| "#{rbrand} (#{original_counts[rbrand]})" },
      datasets: datasets
    }.to_json

    @grades = GradeMaster.pluck(:name)
    @structures = StructureMaster.pluck(:name)
    @rmcs = RmcList.where(is_rmc: true).pluck(:name)
    @cement_dosages = StrengthTesting.pluck('cement_c_c_kg_m3').compact.uniq
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def building
    @buildings = BuildingMaster.all.select(:id, :name)
  end

  def structure 
    @structures = StructureMaster.all.select(:id, :name)
  end

  def grade
      # @grades = GradeMaster.all.pluck(:id, :name)
    @grades = GradeMaster.all
    @structure = StructureMaster.find(params[:structure_id])
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
        return 0 # Return 0 iF there are no valid result values
      end
      
      average = result_values.sum.to_f / result_values.size
      average.round
    end

    def get_result_value(testing_results, slot_type, attempts)
      result = testing_results&.find_by(slot_type: slot_type, attempts: attempts)&.result_value
      result || 0
    end

end
       

















 
  