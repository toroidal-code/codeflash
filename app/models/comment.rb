class Comment < ActiveRecord::Base
  include Votable
  belongs_to :profile
  belongs_to :commentable, polymorphic: true

  validates :body,
    length: { maximum: 500 },
    presence: true
end
