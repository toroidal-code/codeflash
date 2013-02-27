# An achievement which can be rewarded to users.
class Achievement < ActiveRecord::Base
  has_and_belongs_to_many :solutions

  validates :name, :description, :points,
    presence: true
  validates :points,
    numericality: { only_integer: true, greater_than: 0 }
end
