class Problem < ActiveRecord::Base
	has_many :solutions
	belongs_to :user
  attr_accessible :description, :point_value, :problem_name
end
