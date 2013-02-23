# An achievement which can be rewarded to users.
class Achievement < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_and_belongs_to_many :solutions

  validates :name, :description, :point_value,
    presence: true
  validates :point_value,
    numericality: { only_integer: true, greater_than: 0 }
end
