# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl'
require Rails.root.join('db', 'factories')

USERS.count.times do
  FactoryGirl.create :user
end

PROBLEMS.count.times do
  FactoryGirl.create :problem
end

LANGUAGES.count.times do
  FactoryGirl.create :language
end

SOLUTIONS.count.times do
  FactoryGirl.create :solution
end

Language.all.each do |language|
  achievement = Achievement.create!({
    name: "Best Solution - #{language.name}",
    points: 15,
    description: "Awarded for having the best #{language.name} solution for a given problem 30 days after problem creation"
  })
  solution = Solution.where(problem_id: Problem.find_by_shortname('swag'), language_id: language).first
  if solution.present?
    solution.achievements << achievement
    solution.save!
  end
end

profiles = YAML.load_file(Rails.root.join('db/seed_data/profiles.yml'))
2.times do |x|
  Profile.find(x+1).update_attributes(profiles[x])
end