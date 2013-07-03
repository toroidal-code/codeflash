#A comment that is assigned to either a post or a solution
class Comment < ActiveRecord::Base
  include Votable
  before_save :render_body

  belongs_to :profile
  belongs_to :commentable, polymorphic: true
  has_many :flags, as: :flaggable

  validates :body,
    length: { maximum: 500 },
    presence: true

  private
  def render_body
    renderer = PygmentizeHelper::PygmentizeHTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    self.rendered_body = redcarpet.render self.body
  end
end
