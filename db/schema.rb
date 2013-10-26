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

ActiveRecord::Schema.define(:version => 20131015225911) do

  create_table "functions", :force => true do |t|
    t.string "functions"
  end

  create_table "marathon_photos", :force => true do |t|
    t.integer "marathon_id"
    t.integer "photo_id"
    t.string  "bib_number"
  end

  create_table "marathons", :force => true do |t|
    t.string  "name"
    t.date    "Date"
    t.string  "city"
    t.string  "state"
    t.string  "country"
    t.decimal "distance"
  end

  create_table "photos", :force => true do |t|
    t.string  "image_location"
    t.integer "owner_id"
  end

  create_table "photos_comments", :force => true do |t|
    t.integer "user_photo_id"
    t.integer "from_user_id"
    t.date    "date"
    t.string  "comment"
  end

  create_table "privacy_categories", :force => true do |t|
    t.string "category"
  end

  create_table "privacy_settings", :force => true do |t|
    t.string "setting"
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
    t.integer "user_id"
    t.integer "marathon_id"
  end

  create_table "user_photos", :force => true do |t|
    t.integer "photo_id"
    t.integer "user_id"
  end

  create_table "user_privacy_settings", :force => true do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.integer "setting_id"
  end

  create_table "user_training", :force => true do |t|
    t.integer "user_id"
    t.date    "Date"
    t.string  "Detail"
    t.string  "category"
  end

  create_table "users", :force => true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.date    "dob"
    t.string  "user_name"
    t.string  "password"
    t.integer "default_photo_id"
    t.integer "site_function_id"
    t.integer "locked"
    t.string  "email_address"
  end

end
