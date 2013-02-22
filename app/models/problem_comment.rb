# A comment for a Problem. Can be voted on.
class ProblemComment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Votable, Comment

  belongs_to :problem
end
