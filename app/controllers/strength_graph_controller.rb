class StrengthGraphController < ApplicationController
   
    # GET /strength_testings or /strength_testings.json
    def index
      @buildings = BuildingMaster.all.select(:id, :name)
    end

    def structure 
      @buildings = BuildingMaster.all.select(:id, :name)
      @structures = StructureMaster.all.select(:id, :name)
    end 

    
    def grade
      @structure = StructureMaster.find(params[:structure_id]) if params[:structure_id].present?
      @grades = GradeMaster.all
    end
    

    def compare   
    end

    def build_structure
    end 
  end
  