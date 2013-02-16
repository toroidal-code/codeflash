# Contains a user's progress on Codeflash, along with other information about
# him/her that should appear on his/her profile page.
class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :solutions
  has_many :achievements, :through => :solutions
  has_many :problems
  attr_accessible :about_me, :favorite_language, :github, :name, :user_id

  validates :about_me, :length => {:maximum => 500}

  def to_param
    user.username
  end

end
