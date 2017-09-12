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

ActiveRecord::Schema.define(version: 20170911221501) do

  create_table "boards", force: :cascade do |t|
    t.integer "x1"
    t.integer "x2"
    t.integer "x3"
    t.integer "x4"
    t.integer "x5"
    t.integer "x6"
    t.integer "x7"
    t.integer "x8"
  end

  create_table "moves", force: :cascade do |t|
    t.integer "xid"
    t.integer "yid"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.boolean "winner", default: false
  end

end
