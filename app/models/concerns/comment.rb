module Comment
  extend ActiveSupport::Concern

  included do
    belongs_to :profile
    attr_accessible :body
    validates :body, :length => {:maximum => 200}
  end

end