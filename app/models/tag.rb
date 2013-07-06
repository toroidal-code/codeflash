# A tag for problems.
class Tag < ActiveRecord::Base
  has_and_belongs_to_many :problems

  validates :name,
    uniqueness: true,
    presence: true
end
