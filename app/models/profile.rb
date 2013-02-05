class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :about_me, :favorite_language, :github, :name
end
