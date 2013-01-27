class Achievement < ActiveRecord::Base
  belongs_to :solution
  attr_accessible :description, :name, :point_value
end
