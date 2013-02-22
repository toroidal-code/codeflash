# A comment for a Solution. Can be voted on.
class SolutionComment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Votable, Comment

  belongs_to :solution
end
