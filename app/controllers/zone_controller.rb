class ZoneController < ApplicationController
  helper_method :get_result_value, :calculate_color, :calculate_average, :fs_calculate_color
    
  def index
  end

  # def red
  #  if current_user.current_user.qa_lab_incharge? 
  #     building_ids = cuurent_user.building_masters
  #     if building_ids.present?
  #       @green_values = green
  #       @red_values = StrengthTesting.where(is_red: true).where(building_masters: { id: building_ids }).where.not(id: @green_values.pluck(:id))
  #     end
  #  else 
  #     @green_values = green
  #     @red_values = StrengthTesting.where(is_red: true).where.not(id: @green_values.pluck(:id))
  #  end
  # end

  def red 
    @green_values = green
    @red_values = StrengthTesting.where(is_red: true).where.not(id: @green_values.pluck(:id))
  end

  def grey
    @grey_values = StrengthTesting.where(is_gray: true)
    @strength_acceptances = StrengthAcceptance.all
  end

  def green
    @green_values = StrengthTesting.where(is_green: true)
  end
  
  def send_red_values_email
    # Fetch the selected user based on recipient_id
    recipient = User.find(params[:recipient_id])

    # Fetch the selected IDs from the form
    selected_ids = params[:selectedRows]

    # Fetch the red data based on selected IDs
    red_values = StrengthTesting.where(id: selected_ids, is_red: true)

    # Send the email to the selected recipient
    UserMailer.red_values_email(recipient, red_values).deliver_now

    redirect_to '/zone/red', notice: 'Data sent via email successfully!'
  end

  def send_grey_values_email
    # Fetch the selected user based on recipient_id
    recipient = User.find(params[:recipient_id])
  
    # Fetch the selected IDs from the form
    selected_ids = params[:selectedRows]
  
    # Fetch the grey data based on selected IDs
    grey_values = StrengthTesting.where(id: selected_ids, is_gray: true)
  
    # Send the email to the selected recipient
    UserMailer.grey_values_email(recipient, grey_values).deliver_now
  
    redirect_to '/zone/grey', notice: 'Grey data sent via email successfully!'
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