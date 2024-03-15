module StrengthTestingsHelper
    def num_of_cubes_options
        NumOfCube.all.pluck(:count, :count)
      end
end
