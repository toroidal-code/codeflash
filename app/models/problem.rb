class Problem < ActiveRecord::Base
	has_many :solutions
  attr_accessible :description, :point_value, :problem_name
end
