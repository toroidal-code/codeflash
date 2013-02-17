class ProblemComment < ActiveRecord::Base
  include Votable, Comment

  belongs_to :problem
end
