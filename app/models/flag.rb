class Flag < ActiveRecord::Base
  belongs_to :profile
  belongs_to :flagable, polymorphic: true

  validates :reason, :explanation,
    presence: true
  validates :explanation,
    length: { maximum: 750 }
end
