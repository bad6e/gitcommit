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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151030154858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stats", force: :cascade do |t|
    t.string   "name"
    t.integer  "commits"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "streaks"
    t.integer  "current_streaks"
    t.text     "commit_messages"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "provider"
    t.string   "token"
    t.string   "uid"
    t.string   "image_url"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.text     "repos",             default: "You have no repositories!"
    t.integer  "starred_repos",     default: 0
    t.text     "commit_messages",   default: "You have no commit messages!"
    t.text     "organizations",     default: "You have no organizations"
    t.text     "followers",         default: "No one is following you - LOSER!"
    t.text     "followees",         default: "You are not following anyone!"
    t.integer  "total_commits",     default: 0
    t.integer  "current_streak",    default: 0
    t.integer  "longest_streak",    default: 0
    t.text     "follower_messages", default: "No Commit Messages!"
  end

end
