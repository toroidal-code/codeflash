# An achievement which can be rewarded to users.
class Achievement < ActiveRecord::Base
  has_and_belongs_to_many :solutions
  attr_accessible :description, :name, :point_value

  validates :name, :description, :point_value,
    :presence => true
  validates :point_value,
    :numericality => { :only_integer => true, :greater_than => 0 }
end
