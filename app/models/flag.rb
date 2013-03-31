# The model class representing a flag
class Flag < ActiveRecord::Base
  belongs_to :profile
  belongs_to :flaggable, polymorphic: true

  validates :reason, :explanation,
    presence: true
  validates :explanation,
    length: { maximum: 750 }
end
