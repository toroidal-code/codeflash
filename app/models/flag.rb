# The model class representing a flag
class Flag < ActiveRecord::Base
  # The reasons possible for flagging solutions
  REASONS_SOLUTIONS = ['Duplicate code', 'Malicious code', 'Does not attempt to solve problem',
  'Intentionally obfuscated code', 'Language port', 'Wrong language', 'Not code', 'Other']

  # The Reasons possible for flagging a comment
  REASONS_COMMENTS = ['Spam', 'Off topic', 'Not in English', 'Uncostructive content', 'Inappropriate content', 'Offensive content', 'Other' ]

  belongs_to :profile
  belongs_to :flaggable, polymorphic: true

  validates :reason, :explanation,
    presence: true
  validates :explanation,
    length: { maximum: 750 }
  validates :reason,
    inclusion: {in: REASONS_COMMENTS + REASONS_SOLUTIONS}
end
