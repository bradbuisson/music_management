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

ActiveRecord::Schema.define(:version => 20130116073224) do

  create_table "articles", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "articles", ["created_at"], :name => "index_articles_on_created_at"

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "published",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "blogs", ["created_at"], :name => "index_blogs_on_created_at"

  create_table "shows", :force => true do |t|
    t.string   "date"
    t.string   "time"
    t.string   "venue"
    t.text     "address"
    t.integer  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shows", ["address"], :name => "index_shows_on_address"
  add_index "shows", ["created_at"], :name => "index_shows_on_created_at"
  add_index "shows", ["date"], :name => "index_shows_on_date"
  add_index "shows", ["price"], :name => "index_shows_on_price"
  add_index "shows", ["time"], :name => "index_shows_on_time"
  add_index "shows", ["venue", "address"], :name => "index_shows_on_venue_and_address"
  add_index "shows", ["venue"], :name => "index_shows_on_venue"

  create_table "taggings", :force => true do |t|
    t.integer  "blog_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["blog_id", "tag_id"], :name => "index_taggings_on_blog_id_and_tag_id"
  add_index "taggings", ["blog_id"], :name => "index_taggings_on_blog_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
