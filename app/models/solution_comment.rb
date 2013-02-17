class SolutionComment < ActiveRecord::Base
  include Votable, Comment

  belongs_to :solution
end
