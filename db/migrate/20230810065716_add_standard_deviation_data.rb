class AddStandardDeviationData < ActiveRecord::Migration[7.0]
  def change
    standard_deviations_data = [
      { grade: "M10", v_good: 2.0, good: 2.3, fair: 3.3 },
      { grade: "M15", v_good: 2.5, good: 3.5, fair: 4.5 },
      { grade: "M20", v_good: 3.6, good: 4.6, fair: 5.6 },
      { grade: "M25", v_good: 4.3, good: 5.3, fair: 6.3 },
      { grade: "M30", v_good: 5.0, good: 6.0, fair: 7.0 },
      { grade: "M35", v_good: 5.3, good: 6.3, fair: 7.3 },
      { grade: "M40", v_good: 5.6, good: 6.6, fair: 7.6 },
      { grade: "M45", v_good: 6.0, good: 7.0, fair: 8.0 },
      { grade: "M50", v_good: 6.4, good: 7.4, fair: 8.4 },
      { grade: "M55", v_good: 6.7, good: 7.7, fair: 8.7 },
      { grade: "M60", v_good: 6.8, good: 7.8, fair: 8.8 }
    ]
      
    # Create records for each row of data
    standard_deviations_data.each do |data|
      StandardDeviation.find_or_create_by(grade: data[:grade]) do |sd|
        sd.v_good = data[:v_good]
        sd.good = data[:good]
        sd.fair = data[:fair]
      end
    end
  end
end
