class Achievement < ActiveRecord::Base
  belongs_to :solution
  attr_accessible :description, :name, :point_value
  
  validates :name, :description, :point_value, :presence => true
  validates :point_value, :numericality => { :only_integer => true, :greater_than => 0 }
end
