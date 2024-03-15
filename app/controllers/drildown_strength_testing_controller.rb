 class DrildownStrengthTestingController < ApplicationController
    def index
    end
    def project
        @projects = ProjectMaster.pluck(:id, :name)
        
      end
    
      def building
        @buildings = BuildingMaster.all.select(:id, :name)
        @project_id = params[:project_id]

      end
      def grade
        @grades = GradeMaster.all
        @project_id = params[:project_id]
        @building_id = params[:building_id]
        @grade_id = params[:grade_id]
      end
 
end