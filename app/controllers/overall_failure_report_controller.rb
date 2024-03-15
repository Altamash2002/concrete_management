class OverallFailureReportController < ApplicationController
    helper_method :get_result_value, :calculate_color, :calculate_average, :fs_calculate_color
    def index

        @overall_values = StrengthTesting.where("is_red = ? OR is_gray = ?", true, true)

        @structures = StructureMaster.distinct.pluck(:name)
        @grades = GradeMaster.pluck(:name)
        @buildings = BuildingMaster.pluck(:name)
        @strength_acceptances = StrengthAcceptance.all

        respond_to do |format|
            format.html
            format.turbo_stream
        end

    end

    def overall
        
        structure_name = params["structure_name"]
        building_name = params["building_name"]
        grade_name = params["grade_name"]

        from_date = Date.parse(params["from_date"]) if params["from_date"].present?
        to_date = Date.parse(params["to_date"]) if params["to_date"].present?
        
        @strength_testings = StrengthTesting.includes(:testing_results)

        if structure_name.present?
            @strength_testings = StrengthTesting.where(structure_master: StructureMaster.where(name: structure_name))
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

        @overall_values = @strength_testings.where("is_red = ? OR is_gray = ?", true, true)

        @structures = StructureMaster.distinct.pluck(:name)
        @grades = GradeMaster.pluck(:name)
        @buildings = BuildingMaster.pluck(:name)
        respond_to do |format|
            format.html
            format.turbo_stream
        end

    end
    private
      
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