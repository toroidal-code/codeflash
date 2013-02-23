# A programming language that users can write solutions in.
class Language < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :solutions
  has_many :profiles

  validates :name,
    uniqueness: true,
    presence: true
  validates :syntax_highlighting,
    presence: true
end
