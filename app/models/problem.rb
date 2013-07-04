# A programming problem which is meant to be solved by users.
class Problem < ActiveRecord::Base
  before_save :render_description
  has_many :solutions
  has_many :comments, as: :commentable
  has_and_belongs_to_many :tags

  validates :description, :points, :name, :shortname,
    presence: true
  validates :points,
    numericality: { only_integer: true, greater_than: 0 }
  validates :shortname,
    format: { with: /\A[a-z0-9-]+\z/ },
    uniqueness: true

  # Returns the identifier of the Problem for URLs (its shortname).
  #
  # @return [String] the Problem's shortname
  def to_param
    shortname
  end

  private

  def render_description
    redcarpet = RedcarpetHelper::redcarpet_helper
    self.rendered_description = redcarpet.render self.description
  end
end
