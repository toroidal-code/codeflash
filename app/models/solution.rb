class Solution < ActiveRecord::Base
  belongs_to :user_submitted
  belongs_to :problem
  has_one :language
  attr_accessible :code, :down_votes, :up_votes
end
