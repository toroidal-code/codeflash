class Achievement < ActiveRecord::Base
  attr_accessible :description, :name, :point_value
end
