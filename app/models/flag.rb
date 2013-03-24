class Flag < ActiveRecord::Base
  belongs_to :profile
  belongs_to :flaggable
end
