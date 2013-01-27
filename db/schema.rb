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

ActiveRecord::Schema.define(:version => 20130127024040) do

  create_table "achievements", :force => true do |t|
    t.integer  "solution_id"
    t.string   "name"
    t.text     "description"
    t.integer  "point_value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "achievements", ["solution_id"], :name => "index_achievements_on_solution_id"

  create_table "langage_families", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "langagues", :force => true do |t|
    t.string   "name"
    t.integer  "language_family_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "langagues", ["language_family_id"], :name => "index_langagues_on_language_family_id"

  create_table "problems", :force => true do |t|
    t.integer  "problem_number"
    t.string   "problem_name"
    t.text     "description"
    t.integer  "point_value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "solutions", :force => true do |t|
    t.text     "code"
    t.integer  "user_submitted_id"
    t.integer  "up_votes"
    t.integer  "down_votes"
    t.integer  "problem_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "language_id"
  end

  add_index "solutions", ["problem_id"], :name => "index_solutions_on_problem_id"
  add_index "solutions", ["user_submitted_id"], :name => "index_solutions_on_user_submitted_id"

end
