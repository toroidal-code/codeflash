# A user account on Codeflash. Handles account creation, account management, and
# login. Ever user object holds onto a profile object, which contains the user's
# progress along with other information about the user.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :profile
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :login, :admin
  validates :username, presence: true
  validates :password, format: {with:/(?=.*[a-z])(?=.*[A-Z])(?=\d*)./,
            message: 'must contain at least 1 lowercase character,
                        1 upercase character, and 1 number'}, on: :create
  validates :username, format: {with: /[a-zA-Z][A-Za-z0-9]*/,
            message: 'must start with a letter.'} , length: {minimum: 4}
  validates :username, uniqueness: true
  validates :password, confirmation: true
  after_create :create_profile

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create!(provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
      user.profile.name = auth.extra.raw_info.name
      user.profile.github = auth.extra.raw_info.login
      user.profile.save!
    end
    user
  end

  # GitHub integration. Not currently in use, but we'll leave it here in case we
  # need it in the future.
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email?
      end
    end
  end

  def create_profile
    Profile.create!(:user_id => id)
  end

  #Remove when we have a proper email address
  protected
  def confirmation_required?
    false
  end
end
