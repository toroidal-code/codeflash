class User < ActiveRecord::Base
	has_many :solutions_submitted
	has_many :achievements, :through => :solutions_submitted
	has_many :problems_solved
  attr_accessible :email, :password, :points, :salt, :username, :name, :about_me

  validates :email, :password, :points, :salt, :username, :name, :presence => true
  validates :email, :username, :uniqueness => true
  validates :username, :password, :length => {:minimum => 6}
end
