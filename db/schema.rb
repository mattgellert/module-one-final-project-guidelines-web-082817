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
    t.integer "y1"
    t.integer "y2"
    t.integer "y3"
    t.integer "y4"
    t.integer "y5"
    t.integer "y6"
    t.integer "y7"
    t.integer "y8"
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
