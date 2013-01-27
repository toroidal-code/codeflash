class Problem < ActiveRecord::Base
  attr_accessible :description, :point_value, :problem_name, :problem_number
end
