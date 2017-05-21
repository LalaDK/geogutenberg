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

ActiveRecord::Schema.define(version: 20170521092047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: true do |t|
    t.string "name"
  end

  add_index "authors", ["name"], name: "index_authors_on_name", using: :btree

  create_table "books", force: true do |t|
    t.string  "title"
    t.string  "translator"
    t.date    "release_date"
    t.string  "file_path"
    t.integer "author_id"
  end

  add_index "books", ["author_id"], name: "author_id", using: :btree
  add_index "books", ["file_path"], name: "index_books_on_file_path", using: :btree
  add_index "books", ["title"], name: "index_books_on_title", using: :btree

  create_table "cities", force: true do |t|
    t.string  "geonameid"
    t.string  "name"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "population"
    t.string  "country_code"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree

  create_table "occurrences", force: true do |t|
    t.integer "count",   default: 0
    t.integer "book_id"
    t.integer "city_id"
  end

  add_index "occurrences", ["book_id"], name: "book_id", using: :btree
  add_index "occurrences", ["city_id"], name: "city_id", using: :btree
  add_index "occurrences", ["count"], name: "index_occurrences_on_count", using: :btree

end
