# The model class representing a flag
class Flag < ActiveRecord::Base
  #The reasons possible for a flag
  REASONS = ['Inappropriate', 'Spam', 'Duplicate', 'Other']
  belongs_to :profile
  belongs_to :flaggable, polymorphic: true

  validates :reason, :explanation,
    presence: true
  validates :explanation,
    length: { maximum: 750 }
  validates :reason,
    inclusion: {in: REASONS}
end
