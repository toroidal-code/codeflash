class SolutionComment < ActiveRecord::Base
  belongs_to :solution
  belongs_to :user
  attr_accessible :body, :down_votes, :up_votes
end
