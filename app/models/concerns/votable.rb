# Adds voting functionality to a model. Votable models have up vote and down
# vote counts, along with methods to calculate the total number of votes they
# have.
module Votable
  extend ActiveSupport::Concern

  included do
    #attr_accessible :down_votes, :up_votes
    validates :down_votes, :up_votes,
      numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end

  # Calculates the total number of votes for the Votable model. For now, it
  # simply takes the number of up votes and subtracts it by the number of down
  # votes.
  #
  # @return [Integer] up_votes - down_votes
  def votes
    up_votes - down_votes
  end
end
