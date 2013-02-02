class Language < ActiveRecord::Base
  belongs_to :solution
  attr_accessible :name

  validates :name, :uniqueness => true, :presence => true
end
