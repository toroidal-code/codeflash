# A category of problems.
class Category < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_and_belongs_to_many :problems

  validates :name,
    uniqueness: true,
    presence: true
end
