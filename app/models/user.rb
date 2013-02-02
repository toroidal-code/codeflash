class User < ActiveRecord::Base
	has_many :solutions_submitted
	has_many :achievements, :through => :solutions_submitted
	has_many :problems_solved
  attr_accessible :email, :password, :points, :salt, :username, :name, :about_me, :password_confirmation

  validates :email, :password, :points, :salt, :username, :name, :presence => true
  validates :about_me, :length => {:maximum => 500}
  validates :email, :username, :uniqueness => true
  validates :email, :format => {:with => /.*@.*[.].*/}
  validates :username, :password, :length => {:minimum => 6}
  validates :password, :format => {:with => /(?=.*[a-z])(?=.*[A-Z])(?=\d*)./, 
  					:message => 'must contain at least 1 lowercase character, 
  											1 upercase character, and 1 number'}
  validates :password, :confirmation => true
  validates :points, :numericality => {:only_integer => true, 
  					:greater_than_or_equal_to => 0}
end
