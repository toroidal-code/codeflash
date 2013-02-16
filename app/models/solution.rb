class Solution < ActiveRecord::Base
  include Votable

  belongs_to :profile
  belongs_to :problem
  belongs_to :language
  has_and_belongs_to_many :achievements
  has_many :comments, class_name: 'SolutionComment'
  attr_accessible :code, :problem_id

  validates :code, :presence => true

  delegate :shortname, to: :problem, prefix: true
end
