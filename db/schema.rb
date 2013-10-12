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

ActiveRecord::Schema.define(:version => 20131012181613) do

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

  create_table "privacy_categories", :force => true do |t|
    t.string "category"
  end

  create_table "privacy_settings", :force => true do |t|
    t.string "setting"
  end

end
