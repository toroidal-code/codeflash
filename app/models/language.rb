class Language < ActiveRecord::Base
  belongs_to :solution
  attr_accessible :name
end
