class Solution < ActiveRecord::Base
  belongs_to :profile
  belongs_to :problem
  belongs_to :language
  has_and_belongs_to_many :achievements
  attr_accessible :code, :down_votes, :up_votes

  validates :code, :presence => true
  validates :down_votes, :up_votes, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}

  def score
    up_votes - down_votes
  end
end
