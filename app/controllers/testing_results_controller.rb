class TestingResultsController < ApplicationController

  def edit_testing_results
    @strength_testing = StrengthTesting.find(params[:id])
    @day = params[:day]
    @testing_results = @strength_testing.testing_results.where(slot_type: @day)

    @daily_testing = true
  end

  def update_testing_results
    @strength_testing = StrengthTesting.find(params[:id])
    if @strength_testing.save
      render json: @strength_testing
      return
    else
      render json: @strength_testing.errors, status: :unprocessable_entity
      return
    end
  end
  def all_testing_results
    # Fetch all TestingResult records
    @all_testing_results = TestingResult.all
  
    
  end

  def show_all_testing_results
    @strength_testing = StrengthTesting.find(params[:id])
    @testing_results = @strength_testing.testing_results

    @daily_testing = true
  end
end