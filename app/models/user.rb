class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :solutions_submitted
	has_many :achievements, :through => :solutions_submitted
	has_many :problems_solved
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :about_me
  # attr_accessible :title, :body
  validates :email, :password, :presence => true
  validates :about_me, :length => {:maximum => 500}
  validates :email, :uniqueness => true
  validates :password, :confirmation => true
end
