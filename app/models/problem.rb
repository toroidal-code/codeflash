# A programming problem which is meant to be solved by users.
class Problem < ActiveRecord::Base
  has_many :solutions
  has_many :comments, class_name: 'ProblemComment'
  has_and_belongs_to_many :categories
  attr_accessible :description, :point_value, :problem_name, :shortname

  validates :description, :point_value, :problem_name, :shortname,
    presence: true
  validates :point_value,
    numericality: { only_integer: true, greater_than: 0 }
  validates :shortname,
    format: {with: /[a-z]+/},
    uniqueness: true

  # Returns the identifier of the Problem for URLs (its shortname).
  #
  # @return [String] the Problem's shortname
  def to_param
    shortname
  end
end
