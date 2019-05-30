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

ActiveRecord::Schema.define(version: 2019_05_29_143730) do

  create_table "movelists", force: :cascade do |t|
    t.integer "pp"
    t.integer "pocketmonster_trainer_id"
    t.integer "move_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "base_damage"
    t.string "element"
  end

  create_table "pocketmonster_trainers", force: :cascade do |t|
    t.integer "trainer_id"
    t.integer "pocketmonster_id"
    t.integer "hitpoints"
  end

  create_table "pocketmonsters", force: :cascade do |t|
    t.string "name"
    t.integer "hp", default: 60
    t.string "element"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
  end

end
