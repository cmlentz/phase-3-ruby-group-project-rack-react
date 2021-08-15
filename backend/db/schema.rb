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

ActiveRecord::Schema.define(version: 2021_08_15_185326) do

  create_table "rivers", force: :cascade do |t|
    t.string "name"
    t.string "country"
  end

  create_table "single_fishes", force: :cascade do |t|
    t.string "species"
    t.integer "weight"
    t.integer "rarity"
    t.boolean "caught"
    t.integer "river_id"
    t.index ["river_id"], name: "index_single_fishes_on_river_id"
  end

end
