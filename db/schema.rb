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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_05_11_152005) do
=======
ActiveRecord::Schema.define(version: 2021_05_11_023244) do
>>>>>>> ffae81cd64afff7859b655a8640743508ce32d7c

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "guitars", force: :cascade do |t|
    t.float "price"
    t.string "model"
    t.boolean "sold"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "brand"
    t.integer "days_since_last_incident"
    t.boolean "domestic"
=======
  create_table "stores", force: :cascade do |t|
    t.integer "distance"
    t.string "name"
    t.string "open"
>>>>>>> ffae81cd64afff7859b655a8640743508ce32d7c
  end

end
