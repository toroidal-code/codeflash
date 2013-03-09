# A programming language that users can write solutions in.
class Language < ActiveRecord::Base
  has_many :solutions
  has_many :profiles

  validates :name,
    uniqueness: true,
    presence: true
  validates :ace_syntax, :pygments_syntax,
    presence: true
end
