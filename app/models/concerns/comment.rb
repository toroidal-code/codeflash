# Adds comment functionality to a model. Comments are owned by a profile and
# contain text (with a maximum of 200 characters).
module Comment
  extend ActiveSupport::Concern

  included do
    belongs_to :profile
    attr_accessible :body
    validates :body,
      length: { maximum: 200 },
      presence: true
  end
end
