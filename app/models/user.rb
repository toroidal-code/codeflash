class User < ActiveRecord::Base
	has_many :achievments
	has_many :solutions_submitted
	has_many :problems_solved
  attr_accessible :email, :password, :points, :salt, :username, :name, :about_me
end
