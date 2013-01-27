class LanguageFamily < ActiveRecord::Base
	has_many :languages
  attr_accessible :description, :name
end
