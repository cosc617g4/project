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

ActiveRecord::Schema.define(:version => 20131203021259) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "functions", :force => true do |t|
    t.string "functions"
  end

  create_table "marathons", :force => true do |t|
    t.string  "name"
    t.date    "Date"
    t.string  "city"
    t.string  "state"
    t.string  "country"
    t.decimal "distance"
  end

  create_table "messages", :force => true do |t|
    t.string   "topic"
    t.text     "body"
    t.integer  "received_messageable_id"
    t.string   "received_messageable_type"
    t.integer  "sent_messageable_id"
    t.string   "sent_messageable_type"
    t.boolean  "opened",                     :default => false
    t.boolean  "recipient_delete",           :default => false
    t.boolean  "sender_delete",              :default => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "ancestry"
    t.boolean  "recipient_permanent_delete", :default => false
    t.boolean  "sender_permanent_delete",    :default => false
  end

  add_index "messages", ["ancestry"], :name => "index_messages_on_ancestry"
  add_index "messages", ["sent_messageable_id", "received_messageable_id"], :name => "acts_as_messageable_ids"

  create_table "photos", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "userphoto_file_name"
    t.string   "userphoto_content_type"
    t.integer  "userphoto_file_size"
    t.datetime "userphoto_updated_at"
  end

  create_table "phototags", :force => true do |t|
    t.integer  "photoid"
    t.string   "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "privacy_categories", :force => true do |t|
    t.string "category"
  end

  create_table "privacy_settings", :force => true do |t|
    t.string "setting"
  end

  create_table "trainings", :force => true do |t|
    t.date     "date"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "distance"
    t.integer  "hours"
    t.integer  "minutes"
  end

  create_table "user_comments", :force => true do |t|
    t.integer "from_user_id"
    t.integer "to_user_id"
    t.string  "comment"
    t.date    "date"
    t.integer "private_message"
  end

  create_table "user_friends", :force => true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "user_marathons", :force => true do |t|
    t.integer  "user_id"
    t.integer  "marathon_id"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "place"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_marathons", ["user_id"], :name => "index_user_marathons_on_user_id"

  create_table "user_privacy_settings", :force => true do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.integer "setting_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",                                :null => false
    t.string   "last_name",                                 :null => false
    t.date     "dob",                                       :null => false
    t.integer  "default_photo_id"
    t.integer  "site_function"
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0,     :null => false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
