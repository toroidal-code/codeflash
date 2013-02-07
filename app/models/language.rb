class Language < ActiveRecord::Base
  has_many :solutions
  attr_accessible :name

  validates :name, :uniqueness => true, :presence => true
end
