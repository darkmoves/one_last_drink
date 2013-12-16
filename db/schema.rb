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

ActiveRecord::Schema.define(version: 20131216214514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: true do |t|
    t.text     "name"
    t.text     "address"
    t.decimal  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bars_stations", force: true do |t|
    t.integer "bar_id"
    t.integer "station_id"
  end

  create_table "stations", force: true do |t|
    t.text     "name"
    t.decimal  "lat"
    t.decimal  "long"
    t.time     "last_train_nb"
    t.time     "last_train_sb"
    t.text     "line"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
