# A solution to a problem written by a user in a known language. Solutions have
# source code along with up votes and down votes, which are used to judge how
# well the user did with his/her solution. Vote counts affect the scores of
# users. Additionally, users can win achievements from having good solutions.
class Solution < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Votable

  belongs_to :profile
  belongs_to :problem
  belongs_to :language
  has_and_belongs_to_many :achievements
  has_many :comments, as: :commentable
  has_many :flags, as: :flaggable

  validates :code,
    presence: true
  validate :one_per_language

  delegate :shortname, to: :problem, prefix: true

  def one_per_language
    if profile.solutions.where(problem_id: problem, language_id: language).count == 1 && not profile.solutions.include?(self)
     errors.add(:base, "Already created a solution for this problem in this language")
    end
  end
end
