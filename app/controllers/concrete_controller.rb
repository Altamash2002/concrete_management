# frozen_string_literal: true

# All the business logic for concrete strength record
class ConcreteController < ApplicationController
  def concrete_strength_record
    # @projects = ProjectMaster.all.order(:created_at)
    @projects = ProjectMaster.all.order("created_at DESC")
    # @building_names = @projects.map { |project| project.building_master.present? ? project.building_master.name : nil }
    @project = ProjectMaster.new
  end

  # edit concrete strength table
  def edit
    @project = ProjectMaster.find(params[:id])
  end

  # update concrete strength table
  def update
    @project = ProjectMaster.find(params[:id])
    if @project.update(project_params)
      redirect_to concrete_strength_record_path, notice: "Concrete record updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @project = ProjectMaster.find(params[:id]) rescue nil
    if @project.nil?
      alert = "Project not found!"
      return
    end
    @project.destroy
    redirect_to concrete_concrete_strength_record_path, notice: "Concrete record deleted successfully."
  end

  def new
    @project = ProjectMaster.new
  end

  private

  def project_params
    def project_params
      params.require(:project).permit(
        :name,
        :date,
        building_master_attributes: [
          :name
        ],
        concrete_attributes: [
          :rmc_site_concrete,
          :structure,
          :grade,
          recipe_attributes: [
            cement_attributes: [:wb_ratio, :brand, :dosage],
            superplasticizer_attributes: [:brand, :dosage],
            m_admixture_attributes: [:brand, :dosage],
            m_silica_attributes: [:brand, :dosage]
          ]
        ],
        strength_testing_attributes: [
          :density,
          :remark,
          testing_results_attributes: [
            :result_value
          ],
        ]
      )
    end
  end
  

end
