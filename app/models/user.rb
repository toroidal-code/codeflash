# A user account on Codeflash. Handles account creation, account management, and
# login. Ever user object holds onto a profile object, which contains the user's
# progress along with other information about the user.
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :confirmable

  has_one :profile
  attr_accessor :login

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :admin

  validates :username,
    presence: true
  validates :username,
    format: { with: /\A[a-zA-Z][A-Za-z0-9]*\z/,
      message: 'must start with a letter.' },
    length: { minimum: 4 }
  validates :username,
    uniqueness: true
  validates :password,
    confirmation: true

  after_create :create_profile

  validate :password_complexity

  # Method to make sure that the passowrd complexity is correct
  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end

  # Finds a User that matches the given conditions.
  #
  # @param [Object] warden_conditions the conditions which the desired User
  # should match
  #
  # @return [User] the User that was found with the given conditions
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # Finds a User with a given GitHub auth. If the User does not already exist, a
  # new one is created with the given GitHub auth.
  #
  # @param [Object] auth the auth of the User that should be found/created
  # @param [Object] signed_in_resource currently unused (please document)
  #
  # @return [User] the User that was found with the GitHub auth, or a new User
  # with the GitHub auth
  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
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

  # Creates a new User with a given session.
  #
  # Used for GitHub integration. Not currently in use, but we'll leave it here
  # in case we need it in the future.
  #
  # @param [Object] params the parameters used to create the new User
  # @param [Object] session the session used to create the new User
  #
  # @return [User] the new User
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email?
      end
    end
  end

  # Creates a new Profile for the new User and adds it to the database.
  #
  # @return [Profile] the new profile, which is connected to the new User
  # and added to the database
  def create_profile
    Profile.create!(user_id: id)
  end

  # Remove when we have a proper email address.
  protected

  # Returns true if confirmation is required (it is currently not).
  #
  # @return [FalseClass] false
  def confirmation_required?
    false
  end
end
