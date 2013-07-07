require 'yaml'

USERS = YAML.load_file(Rails.root.join('db/seed_data/users.yml'))
FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| USERS[n-1]['email']}
    sequence(:username) {|n| USERS[n-1]['username']}
    sequence(:password) {|n| USERS[n-1]['password']}
    sequence(:admin) {|n| USERS[n-1]['admin']}
  end
end