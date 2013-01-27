class Language < ActiveRecord::Base
  belongs_to :language_family
  attr_accessible :name
end
