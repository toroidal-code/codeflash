class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :solutions
	has_many :achievements, :through => :solutions
	has_many :problems
  has_one :profile
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name,
                  :about_me, :username, :login
  attr_accessor :login
  # attr_accessible :title, :body
  validates :email, :password, :presence => true
  validates :about_me, :length => {:maximum => 500}
  validates :email, :uniqueness => true
  validates :password, :confirmation => true
  after_create :create_child

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def create_profile
    Profile.create(:user_id => id).save
  end
end
