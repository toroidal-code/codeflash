# An achievement which can be rewarded to users.
class Achievement < ActiveRecord::Base
  before_save :render_description
  has_and_belongs_to_many :solutions

  validates :name, :description, :points,
    presence: true
  validates :points,
    numericality: { only_integer: true, greater_than: 0 }

  private

  def render_description
    redcarpet = RedcarpetHelper.redcarpet_helper
    self.rendered_description = redcarpet.render self.description
  end
end
