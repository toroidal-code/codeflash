# A programming language that users can write solutions in.
class Language < ActiveRecord::Base
  has_many :solutions

  validates :name,
    uniqueness: true,
    presence: true
  validates :syntax_highlighting,
    presence: true
end
