# A programming problem which is meant to be solved by users.
class Problem < ActiveRecord::Base
  has_many :solutions
  has_many :comments, class_name: 'ProblemComment'
  has_and_belongs_to_many :categories

  validates :description, :points, :name, :shortname,
    presence: true
  validates :points,
    numericality: { only_integer: true, greater_than: 0 }
  validates :shortname,
    format: { with: /[a-z0-9-]+/ },
    uniqueness: true

  # Returns the identifier of the Problem for URLs (its shortname).
  #
  # @return [String] the Problem's shortname
  def to_param
    shortname
  end
end
