# A solution to a problem written by a user in a known language. Solutions have
# source code along with up votes and down votes, which are used to judge how
# well the user did with his/her solution. Vote counts affect the scores of
# users. Additionally, users can win achievements from having good solutions.
class Solution < ActiveRecord::Base
  include Votable

  belongs_to :profile
  belongs_to :problem
  belongs_to :language
  has_and_belongs_to_many :achievements
  has_many :comments, class_name: 'SolutionComment'

  #attr_accessible :code, :problem_id

  validates :code,
    presence: true

  delegate :shortname, to: :problem, prefix: true
end
