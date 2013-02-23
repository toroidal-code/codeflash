# Contains a user's progress on Codeflash, along with other information about
# him/her that should appear on his/her profile page.
class Profile < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :user
  belongs_to :language
  has_many :solutions
  has_many :achievements, through: :solutions
  has_many :problems
  has_many :problem_comments
  has_many :solution_comments

  validates :about_me,
    length: { maximum: 750 }

  # Returns the identifier of the Profile for URLs (the username of its User).
  #
  # @return [String] the Profile's User's username
  def to_param
    user.username
  end
end
