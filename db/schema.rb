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

ActiveRecord::Schema.define(:version => 20120131105405) do

  create_table "admins", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",                 :default => ""
    t.string   "password_salt",                      :default => ""
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token",     :limit => 20
    t.datetime "invitation_sent_at"
    t.string   "name"
    t.string   "surname"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["invitation_token"], :name => "index_admins_on_invitation_token"
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "albumable_type"
    t.integer  "albumable_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.text     "body"
    t.string   "navlabel"
  end

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "links", :force => true do |t|
    t.integer  "page_id"
    t.integer  "category_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.text     "description"
    t.text     "embed_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "georss"
  end

  create_table "metatags", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "keywords"
    t.integer  "metatagable_id"
    t.string   "metatagable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "navlabel"
    t.integer  "position"
    t.integer  "parent_id"
    t.text     "body"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "draft",       :default => true
    t.string   "home"
    t.string   "image_title"
    t.boolean  "cropped"
  end

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.integer  "gallery_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "cropped"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.text     "body"
    t.integer  "category_id"
    t.integer  "position"
    t.datetime "published_on"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "open"
    t.text     "rates"
    t.string   "address"
    t.string   "website"
    t.string   "phone"
    t.string   "email"
    t.datetime "start_at"
    t.datetime "end_at"
  end

  create_table "simples", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.integer  "simpleable_id"
    t.string   "simpleable_type"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.string   "image_title"
    t.boolean  "cropped"
  end

  create_table "uploads", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.text     "description"
    t.integer  "album_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "cropped"
  end

end
