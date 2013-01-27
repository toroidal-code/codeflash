class Solution < ActiveRecord::Base
  belongs_to :user_submitted
  belongs_to :problem
  attr_accessible :code, :down_votes, :up_votes
end
