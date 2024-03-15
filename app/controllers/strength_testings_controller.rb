class StrengthTestingsController < ApplicationController
  before_action :set_strength_testing, only: %i[ show edit update destroy ]
  helper_method :get_result_value, :calculate_color, :calculate_average, :fs_calculate_color

  # GET /strength_testings or /strength_testings.json
  def index
    if current_user.lab_technician? || current_user.qa_lab_incharge? || current_user.site_incharge?  # Check if the current user is a lab technician
      building_ids = current_user.building_masters
      if building_ids.present?
        included_ids = TestingResult.joins(strength_testing: :building_master).where(building_masters: { id: building_ids }).where.not(result_value: 0).pluck(:strength_testing_id)
        @strength_testings = StrengthTesting.includes(:testing_results).where(id: included_ids).order(:date)
      else
        @strength_testings = StrengthTesting.none # No buildings assigned, return an empty result
      end
    elsif current_user.project_incharge?
      # Check if the current user is a Project Incharge
      project_ids = current_user.project_master_id
      if project_ids.present?
        # Show data specific to the project assigned to the Project Incharge
        included_ids = TestingResult.joins(strength_testing: :project_master)
          .where(project_masters: { id: project_ids })
          .where.not(result_value: 0)
          .pluck(:strength_testing_id)
        @strength_testings = StrengthTesting.includes(:testing_results)
          .where(id: included_ids)
          .order(:date)
      else
        @strength_testings = StrengthTesting.none # No projects assigned, return an empty result
      end
    else
      included_ids = TestingResult.where.not(result_value: 0).pluck(:strength_testing_id)
      @strength_testings = StrengthTesting.includes(:testing_results).where(id: included_ids).order(:date)
    end 

    project_id = params[:project_id]
    building_id = params[:building_id]
    grade_id = params[:grade_id]

    d_project_name = ProjectMaster.find_by(id: project_id)&.name
    d_building_name = BuildingMaster.find_by(id: building_id)&.name
    d_grade_name = GradeMaster.find_by(id: grade_id)&.name
    # # strength testing drill down filter
    if d_project_name.present?
      @strength_testings = @strength_testings.where(project_master: ProjectMaster.where(name: d_project_name))
    end
    if d_building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: d_building_name))
    end
    if d_grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: d_grade_name))
    end

    # # strength filterbar controller
    @structures = StructureMaster.distinct.pluck(:name)
    @grades = GradeMaster.all.pluck(:name)
    @buildings = BuildingMaster.all.pluck(:name)
    @strength_acceptances = StrengthAcceptance.all

    @pagy, @strength_testings = pagy_countless(@strength_testings, items: 1)

    if params[:page]
      render "scrollable_list" 
      return
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def calculate_status(testing_result_value, grade, day)
    @strength_testings.each do |st|
      acceptance_value = StrengthAcceptance.find_by(grade: "M70", day: "28 days")&.value.to_i
      testing_result_value = st.calculate_result_28_days.to_i  # Replace 'calculate_result_28_days' with the correct method name
    
      if testing_result_value >= acceptance_value || testing_result_value == 0
        num_passed_in_28_days += 1
      else
        num_failed_in_28_days += 1
      end
    end
  end

  def building_name
    @buildings = BuildingMaster.all.pluck(:name)
        building_id = params[:building_id]
  end


  def last_30_days
    
    hgrade = "M70"
    
    building_name = params["building_name"]
    grade_name = params["grade_name"]

    included_ids = TestingResult.where.not(result_value: 0).pluck(:strength_testing_id)
    @strength_testings = StrengthTesting.includes(:testing_results).where(id: included_ids).limit(30).order(:date)


    # filter logic
  
    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: grade_name))      
      hgrade = grade_name
    end

    # Initialize an empty hash to store data for each cement brand
    @cement_averages = {}

    # Group the strength testings by cement brand
    @strength_testings.group_by { |st| st.cement&.brand }.each do |cement_brand, cement_strength_testings|
      # Initialize a hash to store averages for each day
      averages_by_day = {
        '3 days' => [],
        '10 days' => [],
        '14 days' => [],
        '15 days' => [],
        '28 days' => []
      }

      # Calculate averages for each day
      cement_strength_testings.each do |st|
        averages_by_day['3 days'] << calculate_average(st.testing_results, '3 days', 0)
        averages_by_day['10 days'] << calculate_average(st.testing_results, '10 days', 0)
        averages_by_day['14 days'] << calculate_average(st.testing_results, '14 days', 0)
        averages_by_day['15 days'] << calculate_average(st.testing_results, '15 days', 0)
        averages_by_day['28 days'] << calculate_average(st.testing_results, '28 days', 0)
      end 

      # Calculate the average of averages for each day
      average_of_averages = averages_by_day.transform_values do |averages|
        averages.sum / averages.size.to_f.round()
      end
      # Store the result in the hash
      @cement_averages[cement_brand] = average_of_averages
    end 
      
    
    @strength_acceptances = StrengthAcceptance.where(grade: hgrade, day: ["3 days", "10 days", "14 days", "15 days", "28 days"]).sort_by { |acceptance| acceptance.day.scan(/\d+/).first.to_i }


    
    # # strength filterbar controller
    @grades = GradeMaster.all.pluck(:name)
    @buildings = BuildingMaster.all.pluck(:name)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def failed_status
    building_name = params["building_name"]
    grade_name = params["grade_name"]

    included_ids = TestingResult.where.not(result_value: 0).pluck(:strength_testing_id)
    @strength_testings = StrengthTesting.includes(:testing_results).where(id: included_ids).limit(30).order(:date)


    # filter logic
  
    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: grade_name))      
      hgrade = grade_name
    end

    # Initialize an empty hash to store cement-wise data
    @cement_data = {}

    # Loop through the strength testings and group data by cement_id
    @strength_testings.each do |st|
      cement_id = st.cement_id

     # If the cement_id is not already in the hash, initialize it
      @cement_data[cement_id] ||= {
        brand: st.cement&.brand,
        percentage_failed_in_28_days: 0,
        total_data_in_28_days: 0,
        num_passed_in_28_days: 0,
        num_failed_in_28_days: 0
      }

      # Calculate the average result for 28 days
      average_result = calculate_average(st.testing_results, '28 days', 0)

      # Fetch the corresponding strength acceptance value for 28 days
      strength_acceptance = StrengthAcceptance.find_by(grade: "M70", day: "28 days")

      # Increment the counts based on pass/fail criteria
      if average_result >= (strength_acceptance&.value || 0)
        @cement_data[cement_id][:num_passed_in_28_days] += 1
      else
        @cement_data[cement_id][:num_failed_in_28_days] += 1
      end

      # Increment the total data count for this cement_id
      @cement_data[cement_id][:total_data_in_28_days] += 1
    end

    # Calculate the percentage of failed data for each cement_id
    @cement_data.each do |cement_id, data|
      data[:percentage_failed_in_28_days] = (data[:num_failed_in_28_days].to_f / data[:total_data_in_28_days]) * 100
    end


    # Create an array of cement brand names and an array of failure percentages
    cement_names = @cement_data.values.map { |data| data[:brand] || "NA" }
    failure_percentages = @cement_data.values.map { |data| data[:percentage_failed_in_28_days] }

    # Create the @failed_status dataset with labels
    @failed_status = {
      labels: cement_names, # Use cement brand names as labels
      datasets: [
        {
          data: failure_percentages, # Use failure percentages as data
          borderWidth: 0
        }
      ]
    }.to_json

    # # strength filterbar controller
    @grades = GradeMaster.all.pluck(:name)
    @buildings = BuildingMaster.all.pluck(:name)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
 
  def get_strength_filter
    structure_name = params["structure_name"]
    building_name = params["building_name"]
    grade_name = params["grade_name"]
  
    from_date = Date.parse(params["from_date"]) if params["from_date"].present?
    to_date = Date.parse(params["to_date"]) if params["to_date"].present?
  
    included_ids = TestingResult.where.not(result_value: 0).pluck(:strength_testing_id)
    @strength_testings = StrengthTesting.includes(:testing_results).where(id: included_ids).order(:date)
    if structure_name.present?
      @strength_testings = @strength_testings.where(structure_master: StructureMaster.where(name: structure_name))
    end
  
    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: grade_name))
    end
    
    if from_date.present? and !to_date.present?
      @strength_testings = @strength_testings.where('date >= ?', from_date)
    elsif !from_date.present? and to_date.present?
      @strength_testings = @strength_testings.where('date <= ?', to_date)
    elsif from_date.present? and to_date.present?
      @strength_testings = @strength_testings.where('date between (?) and (?)', from_date, to_date)
    end
  
    # strength filterbar controller
    @structures = StructureMaster.distinct.pluck(:name)
    @grades = GradeMaster.pluck(:name)
    @buildings = BuildingMaster.pluck(:name)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
    
    @strength_acceptances = StrengthAcceptance.all
  end  

  def show
  end
  
  def new
    @strength_testing = StrengthTesting.new
    @daily_casting = true
    TestingDayMaster.all.each do |testing_day|
      4.times do |i|
        @strength_testing.testing_results.build(
          slot_type: testing_day.title,
          result_value: 0,
          attempts: i,
          sequence: testing_day.sequence,
        )
      end
    end
  end

  def edit
    if params[:daily_casting].present? && params[:daily_casting] == "true"
      @daily_casting = true
    else
      @daily_testing = true
    end
  end

  def edit_daily_testing
    @strength_testing = StrengthTesting.find(params[:id])
  end

  def create
    @strength_testing = StrengthTesting.new(strength_testing_params)

    respond_to do |format|
      if @strength_testing.save!
        @strength_testing.check_and_set_gray
        @strength_testing.check_and_set_red
        @strength_testing.check_and_set_green
        @strength_testing.enable_testing_days
        @strength_testing.create_daily_testings
        format.html { redirect_to strength_testing_url(@strength_testing), notice: "Strength testing was successfully created." }
        format.json { render :show, status: :created, location: @strength_testing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @strength_testing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @strength_testing.update(strength_testing_params)
        @strength_testing.check_and_set_gray
        @strength_testing.check_and_set_red
        @strength_testing.check_and_set_green
        @strength_testing.enable_testing_days
        @strength_testing.update_daily_testings
        @strength_testing.check_if_failed_and_enable_next_test
        format.html { redirect_to strength_testing_url(@strength_testing), notice: "Strength testing was successfully updated." }
        format.json { render :show, status: :ok, location: @strength_testing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @strength_testing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @strength_testing.destroy

    respond_to do |format|
      format.html { redirect_to strength_testings_url, notice: "Strength testing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def daily_testing
    if current_user.lab_technician?  || current_user.qa_lab_incharge? || current_user.site_incharge?
      building_ids = current_user.building_masters
      if building_ids.present?
        if (params[:show_all].present? && params[:show_all] == "true") || request.post?
          @strength_testings = StrengthTesting.joins(:building_master) # Join with the building_master association
          .includes(:testing_results, :daily_testings)
          .where(building_masters: { id: building_ids })
          .order(:date)
        else
          ids = DailyTesting.where(date: [Date.today, Date.yesterday]).pluck(:strength_testing_id)
          @strength_testings = StrengthTesting
          .joins(:building_master) # Join with the building_master association
          .includes(:testing_results, :daily_testings)
          .where(id: ids, building_masters: { id: building_ids })
          .order(:date)
        end
      else
        @strength_testings = StrengthTesting.none # No projects assigned, return an empty result
      end
    elsif current_user.project_incharge?
      project_ids = current_user.project_master_id
      if project_ids.present?
        if (params[:show_all].present? && params[:show_all] == "true") || request.post?
          @strength_testings = StrengthTesting.joins(:project_master)
          .includes(:testing_results, :daily_testings)
          .where(project_masters: { id: project_ids })
          .order(:date)
        else
          ids = DailyTesting.where(date: [Date.today, Date.yesterday]).pluck(:strength_testing_id)
          @strength_testings = StrengthTesting
          .joins(:project_master)
          .includes(:testing_results, :daily_testings)
          .where(id: ids, project_masters: { id: project_ids })
          .order(:date)
        end
      else
        @strength_testings = StrengthTesting.none # No buildings assigned, return an empty result
      end
    else
      if (params[:show_all].present? && params[:show_all] == "true") || request.post?
        @strength_testings = StrengthTesting.includes(:testing_results, :daily_testings).all.order(:date)
      else
        ids = DailyTesting.where(date: [Date.today, Date.yesterday]).pluck(:strength_testing_id)
        @strength_testings = StrengthTesting.includes(:testing_results, :daily_testings).where(id: ids).order(:date)
      end
    end
    
    
    
    # if (params[:show_all].present? && params[:show_all] == "true") || request.post?
    #   @strength_testings = StrengthTesting.includes(:testing_results, :daily_testings).all.order(:date)
    # else
    #   ids = DailyTesting.where(date:  [Date.today, Date.yesterday]).pluck(:strength_testing_id)
    #   @strength_testings = StrengthTesting.includes(:testing_results, :daily_testings).where(id: ids).order(:date)
    # end

    building_name = params["building_name"]
    one_date = params["one_date"]
  
    from_date = Date.parse(params["from_date"]) if params["from_date"].present?
    to_date = Date.parse(params["to_date"]) if params["to_date"].present?
  

    if building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: building_name))
    end

    if one_date.present?
      @strength_testings = @strength_testings.where(date: one_date)
    end
  
    
    if from_date.present? and !to_date.present?
      @strength_testings = @strength_testings.where('date >= ?', from_date)
    elsif !from_date.present? and to_date.present?
      @strength_testings = @strength_testings.where('date <= ?', to_date)
    elsif from_date.present? and to_date.present?
      @strength_testings = @strength_testings.where('date between (?) and (?)', from_date, to_date)
    end
  
    # strength filterbar controller
    if params[:show_all].present? && params[:show_all] == "true"
      # render json: @strength_testings
      # return
      @pagy, @strength_testings = pagy_countless(@strength_testings, items: 2)
      if params[:page]
        render "daily_testing_scrollable_list" 
        return
      end
    end
    @buildings = BuildingMaster.pluck(:name)
    @onedates = StrengthTesting.pluck(:date)&.compact&.map { |date| date.strftime("%d-%m-%Y") }
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end  

  def average
    testing_results = strength_testing.testing_results.group(:slot_type).average(:result_value)
    
    testing_results.each do |slot_type, average_result|
      puts "Slot Type: #{slot_type}, Average Result Value: #{average_result}"
      puts "Grade Master Name: #{grade_master_name}"
    end
  end

  def bmc_tmc_report
    if current_user.lab_technician? || current_user.qa_lab_incharge? || current_user.site_incharge?  # Check if the current user is a lab technician
      building_ids = current_user.building_masters
      if building_ids.present?
        included_ids = TestingResult.joins(strength_testing: :building_master).where(building_masters: { id: building_ids }).where.not(result_value: 0).pluck(:strength_testing_id)
        @strength_testings = StrengthTesting.includes(:testing_results).where(id: included_ids).order(:date)
      else
        @strength_testings = StrengthTesting.none # No buildings assigned, return an empty result
      end
    elsif current_user.project_incharge?
      project_ids = current_user.project_master_id
      if project_ids.present?
        # Show data specific to the project assigned to the Project Incharge
        included_ids = TestingResult.joins(strength_testing: :project_master)
          .where(project_masters: { id: project_ids })
          .where.not(result_value: 0)
          .pluck(:strength_testing_id)
        @strength_testings = StrengthTesting.includes(:testing_results)
          .where(id: included_ids)
          .order(:date)
      else
        @strength_testings = StrengthTesting.none # No projects assigned, return an empty result
      end
    else
      included_ids = TestingResult.where.not(result_value: 0).pluck(:strength_testing_id)
      @strength_testings = StrengthTesting.includes(:testing_results).where(id: included_ids)  
    end
    @strength_testings = @strength_testings.where(is_red: false)
    structure_id = params[:structure_id]
    building_id = params[:building_id]
    grade_id = params[:grade_id]
    d_structure_name = StructureMaster.find_by(id: structure_id)&.name
    d_building_name = BuildingMaster.find_by(id: building_id)&.name
    d_grade_name = GradeMaster.find_by(name: grade_id)&.name

    # # strength testing drill down filter
    if d_structure_name.present?
      @strength_testings = @strength_testings.where(structure_master: StructureMaster.where(name: d_structure_name))
    end
    if d_building_name.present?
      @strength_testings = @strength_testings.where(building_master: BuildingMaster.where(name: d_building_name))
    end
    if d_grade_name.present?
      @strength_testings = @strength_testings.where(grade_master: GradeMaster.where(name: d_grade_name))
    end

    # # strength filterbar controller
    @structures = StructureMaster.distinct.pluck(:name)
    @grades = GradeMaster.all.pluck(:name)
    @buildings = BuildingMaster.all.pluck(:name)
    @strength_acceptances = StrengthAcceptance.all

    @pagy, @strength_testings = pagy_countless(@strength_testings, items: 1)

    if params[:page]
      render "scrollable_list" 
      return
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

 

  def show_testing_results
    @strength_testing = StrengthTesting.find(params[:id])
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_strength_testing
      @strength_testing = StrengthTesting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def strength_testing_params
      params.require(:strength_testing).permit(:sr_no, :week_no, :density, :new_density,  :remark, :location, :is_verified, :is_rmc, :num_of_cubes_id ,:num_of_cubes,  :project_master_id, :building_master_id, :structure_master_id, :grade_master_id, :rmc_list_id, :cement_id, :s_plasticizer_id, :m_admixture_id, :m_silica_id, :date, :w_b_ratio, :cement_c_c_kg_m3, :s_plasticizer_dosage, :m_admixture_dosage, :m_silica_dosage, :number_of_cubes, :user_id, :testing_results_attributes => [:id, :result_value, :attempts, :slot_type, :user_id, :sequence, :enable], :testing_results => [])
    end

    def calculate_color(testing_result_value, grade, day)
      acceptance_value = StrengthAcceptance.where(grade: grade, day: day).pluck(:value).first.to_i
      testing_result_value.to_i < acceptance_value && testing_result_value.to_i != 0 ? 'red' : 'black'
    end
    
    # Method to get the result value or return 0 if it's nil
    def get_result_value(testing_results, slot_type, attempts)
      result = testing_results&.find_by(slot_type: slot_type, attempts: attempts)&.result_value
      result || 0
    end

    # Method to calculate the average value
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

    def fs_calculate_color(testing_result_value, grade, structure)
      structure_record = StructureMaster.find_by(name: structure)
      if structure_record&.sp_strength
        day_structure = structure_record.sp_strength
        acceptance_value = StrengthAcceptance.where(grade: grade, day: day_structure).pluck(:value).first.to_i
        testing_result_value.to_i < acceptance_value && testing_result_value.to_i != 0 ? 'red' : 'black'
      else
        'black'
      end
    end
end