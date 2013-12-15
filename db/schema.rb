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

ActiveRecord::Schema.define(:version => 20131215195011) do

  create_table "engagements", :force => true do |t|
    t.integer  "speaker_id"
    t.integer  "meeting_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "engagements", ["meeting_id"], :name => "index_engagements_on_meeting_id"
  add_index "engagements", ["speaker_id", "meeting_id"], :name => "index_engagements_on_speaker_id_and_meeting_id", :unique => true
  add_index "engagements", ["speaker_id"], :name => "index_engagements_on_speaker_id"

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "location"
    t.integer  "duration"
  end

  create_table "speakers", :force => true do |t|
    t.string   "name"
    t.string   "bio"
    t.boolean  "moderator"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "job_title"
    t.string   "employer"
    t.text     "bio"
    t.string   "current_project"
    t.boolean  "privacy"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
