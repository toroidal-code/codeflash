# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Require the data files in the right order so dependant data doesn't break
# TODO make this DRY and less hacky
data_root = "#{Rails.root}/db/seed_data/"

require "#{data_root}/languages"
Language.create! LANGUAGES

require "#{data_root}/users"
User.create! USERS

require "#{data_root}/problems"
Problem.create! PROBLEMS

require "#{data_root}/solutions"
Solution.create! SOLUTIONS

# Add achievements for the existing solutions
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
