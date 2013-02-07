class Solution < ActiveRecord::Base
  belongs_to :user_submitted
  belongs_to :problem
  has_one :language
  has_and_belongs_to_many :achievements
  attr_accessible :code, :down_votes, :up_votes

  validates :code, :presence => true
  validates :down_votes, :up_votes, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
end
