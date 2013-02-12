class Problem < ActiveRecord::Base
  has_many :solutions
  has_and_belongs_to_many :categories
  attr_accessible :description, :point_value, :problem_name

  validates :description, :point_value, :problem_name, :presence => true
  validates :point_value, :numericality => { :only_integer => true, :greater_than => 0 }
end
