class User < ActiveRecord::Base
	has_many :achievments, :solutions_submitted, :problems_solved
  attr_accessible :email, :password, :points, :salt, :username
end
