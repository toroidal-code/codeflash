module Votable
  extend ActiveSupport::Concern

  included do
    attr_accessible :down_votes, :up_votes
    validates :down_votes, :up_votes, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  end

  def votes
    up_votes - down_votes
  end
end