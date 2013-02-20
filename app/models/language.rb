# A programming language that users can write solutions in.
class Language < ActiveRecord::Base
  has_many :solutions

  attr_accessible :name, :syntax_highlighting

  validates :name,
    uniqueness: true,
    presence: true
  validates :syntax_highlighting,
    presence: true
end
