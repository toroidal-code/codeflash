class Language < ActiveRecord::Base
  belongs_to :language_family
  belongs_to :solution
  attr_accessible :name
end
