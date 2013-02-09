class Problem < ActiveRecord::Base
	has_many :solutions
  attr_accessible :description, :point_value, :problem_name

  validates :description, :point_value, :problem_name, :presence => true
  validates :point_value, :numericality => { :only_integer => true, :greater_than => 0 }
end
