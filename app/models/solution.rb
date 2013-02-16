# A solution to a problem written by a user in a known language. Solutions have
# source code along with up votes and down votes, which are used to judge how
# well the user did with his/her solution. Vote counts affect the scores of
# users. Additionally, users can win achievements from having good solutions.
class Solution < ActiveRecord::Base
  belongs_to :profile
  belongs_to :problem
  belongs_to :language
  has_and_belongs_to_many :achievements
  attr_accessible :code, :down_votes, :up_votes, :problem_id

  validates :code,
    presence: true
  validates :down_votes, :up_votes,
    numericality: {only_integer: true, greater_than_or_equal_to: 0}

  delegate :shortname, to: :problem, prefix: true
end
