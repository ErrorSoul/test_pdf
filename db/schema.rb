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

ActiveRecord::Schema.define(version: 20150207174713) do

  create_table "daras", force: true do |t|
    t.string   "asset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pharas", force: true do |t|
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "word_id"
  end

  add_index "pharas", ["word_id"], name: "index_pharas_on_word_id"

  create_table "posts", force: true do |t|
    t.text     "text1"
    t.text     "text2"
    t.text     "text3"
    t.text     "text4"
    t.text     "text5"
    t.text     "text6"
    t.text     "text7"
    t.text     "text8"
    t.text     "text9"
    t.text     "text10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "word_assets", force: true do |t|
    t.string   "asset"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "word_id"
  end

  add_index "word_assets", ["word_id"], name: "index_word_assets_on_word_id"

  create_table "word_attachments", force: true do |t|
    t.integer  "word_id"
    t.string   "asset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "word_attachments", ["word_id"], name: "index_word_attachments_on_word_id"

  create_table "words", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
