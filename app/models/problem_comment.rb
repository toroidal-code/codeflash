class ProblemComment < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  attr_accessible :body, :down_votes, :up_votes
end
