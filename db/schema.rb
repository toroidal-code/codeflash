# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130215212823) do

  create_table "achievements", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "point_value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "achievements_solutions", :id => false, :force => true do |t|
    t.integer "achievement_id", :null => false
    t.integer "solution_id",    :null => false
  end

  add_index "achievements_solutions", ["achievement_id", "solution_id"], :name => "index_achievements_solutions_on_achievement_id_and_solution_id", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_problems", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "problem_id",  :null => false
  end

  add_index "categories_problems", ["category_id", "problem_id"], :name => "index_categories_problems_on_category_id_and_problem_id", :unique => true

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "problems", :force => true do |t|
    t.string   "problem_name"
    t.text     "description"
    t.integer  "point_value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "profile_id"
    t.string   "shortname"
  end

  add_index "problems", ["profile_id"], :name => "index_problems_on_profile_id"

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.text     "about_me"
    t.string   "favorite_language"
    t.string   "github"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "solutions", :force => true do |t|
    t.text     "code"
    t.integer  "profile_id"
    t.integer  "up_votes",    :default => 0
    t.integer  "down_votes",  :default => 0
    t.integer  "problem_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "language_id"
  end

  add_index "solutions", ["language_id"], :name => "index_solutions_on_language_id"
  add_index "solutions", ["problem_id"], :name => "index_solutions_on_problem_id"
  add_index "solutions", ["profile_id"], :name => "index_solutions_on_profile_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.string   "username"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
