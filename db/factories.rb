require 'yaml'

# Load up the yaml files
USERS = YAML.load_file(Rails.root.join('db/seed_data/users.yml'))
PROBLEMS = YAML.load_file(Rails.root.join('db/seed_data/problems.yml'))
LANGUAGES = YAML.load_file(Rails.root.join('db/seed_data/languages.yml'))
SOLUTIONS = YAML.load_file(Rails.root.join('db/seed_data/solutions.yml'))

# Create all the factories
FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| USERS[n-1]['email']}
    sequence(:username) {|n| USERS[n-1]['username']}
    sequence(:password) {|n| USERS[n-1]['password']}
    sequence(:admin) {|n| USERS[n-1]['admin']}
  end

  factory :problem do
    sequence(:name) {|n| PROBLEMS[n-1]['name']}
    sequence(:shortname) {|n| PROBLEMS[n-1]['shortname']}
    sequence(:points) {|n| PROBLEMS[n-1]['points']}
    sequence(:description) {|n| PROBLEMS[n-1]['description']}
    sequence(:profile_id) {|n| PROBLEMS[n-1]['profile_id']}
  end

  factory :language do
    sequence(:name) {|n| LANGUAGES[n-1]['name']}
    sequence(:ace_syntax) {|n| LANGUAGES[n-1]['ace_syntax']}
    sequence(:pygments_syntax) {|n| LANGUAGES[n-1]['pygments_syntax']}
  end

  factory :solution do
    sequence(:profile_id) {|n| SOLUTIONS[n-1]['profile_id']}
    sequence(:language) {|n| Language.find_by_name(SOLUTIONS[n-1]['language'])}
    sequence(:problem) {|n| Problem.find_by_shortname(SOLUTIONS[n-1]['problem_shortname'])}
    sequence(:code) {|n| SOLUTIONS[n-1]['code']}
  end
end