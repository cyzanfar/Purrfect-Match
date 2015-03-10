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

ActiveRecord::Schema.define(version: 20150310204853) do

  create_table "breeds", force: :cascade do |t|
    t.string "name"
  end

  create_table "pet_breeds", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "breed_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "age"
    t.string   "size"
    t.string   "picture"
    t.string   "shelter_id"
    t.text     "description"
    t.datetime "last_update"
    t.string   "species"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "city"
    t.string "zip"
  end

end
