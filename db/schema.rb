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

ActiveRecord::Schema.define(:version => 20130406005331) do

  create_table "language_listings", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "language"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "language_to_learns", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "level"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                                              :null => false
    t.string   "city"
    t.string   "country"
    t.string   "lang_spoken"
    t.string   "lang_learning"
    t.string   "gender"
    t.text     "bio"
    t.string   "days_available"
    t.string   "imessage"
    t.string   "skype"
    t.string   "facebook"
    t.string   "msn"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.date     "birthday"
    t.string   "photo"
    t.boolean  "meets_face_to_face",              :default => false
    t.boolean  "meets_online",                    :default => false
    t.boolean  "meets_telephone",                 :default => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "state"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["last_logout_at", "last_activity_at"], :name => "index_users_on_last_logout_at_and_last_activity_at"
  add_index "users", ["meets_face_to_face"], :name => "index_users_on_meets_face_to_face"
  add_index "users", ["meets_online"], :name => "index_users_on_meets_online"
  add_index "users", ["meets_telephone"], :name => "index_users_on_meets_telephone"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
