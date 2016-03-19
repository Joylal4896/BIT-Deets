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

ActiveRecord::Schema.define(version: 20160125063408) do

  create_table "admin_update_clubs", force: :cascade do |t|
    t.string   "clubname",    limit: 255
    t.text     "clubdesc",    limit: 65535
    t.text     "clubweblink", limit: 65535
    t.text     "videolink",   limit: 65535
    t.text     "clubquote",   limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "imagelink",   limit: 65535
    t.string   "shortname",   limit: 255
  end

  create_table "admin_update_executive_bodies", force: :cascade do |t|
    t.string   "club",            limit: 255
    t.string   "name",            limit: 255
    t.string   "role",            limit: 255
    t.string   "role_first_char", limit: 255
    t.string   "fb_link",         limit: 255
    t.string   "twitter_link",    limit: 255
    t.string   "contact",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.string   "name",            limit: 255
    t.integer  "accesslevel",     limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "approves", force: :cascade do |t|
    t.string   "post_id",      limit: 255
    t.boolean  "app1"
    t.boolean  "app2"
    t.boolean  "app3"
    t.string   "app_comment1", limit: 255
    t.string   "app_comment2", limit: 255
    t.string   "app_comment3", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "bitotsav_admins", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "bitotsav_organisers", force: :cascade do |t|
    t.string   "Name",       limit: 255
    t.string   "Role",       limit: 255
    t.integer  "Rating",     limit: 4
    t.boolean  "Activity"
    t.string   "Team",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bitotsav_volunteers", force: :cascade do |t|
    t.string   "Name",       limit: 255
    t.string   "Role",       limit: 255
    t.integer  "Rating",     limit: 4
    t.boolean  "Activity"
    t.string   "Team",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bitotsavcores", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "contact",    limit: 255
    t.string   "fblink",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "mail",            limit: 255
    t.string   "name",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "club",            limit: 255
    t.string   "password_digest", limit: 255
    t.string   "confirmation",    limit: 255
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "name",       limit: 65535, null: false
    t.text     "rollno",     limit: 65535, null: false
    t.text     "branch",     limit: 65535, null: false
    t.text     "email",      limit: 65535, null: false
    t.text     "phoneno",    limit: 65535
    t.text     "feedback",   limit: 65535
    t.text     "putmore",    limit: 65535
    t.text     "contactvia", limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "our_requirements", force: :cascade do |t|
    t.string   "club",         limit: 255
    t.string   "requirements", limit: 255
    t.text     "file",         limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "club",          limit: 255
    t.string   "title",         limit: 255
    t.text     "image2",        limit: 65535
    t.text     "image3",        limit: 65535
    t.text     "video1",        limit: 65535
    t.text     "video2",        limit: 65535
    t.text     "file1",         limit: 65535
    t.text     "file2",         limit: 65535
    t.text     "file3",         limit: 65535
    t.text     "shortdesc",     limit: 65535
    t.text     "longdesc",      limit: 65535
    t.string   "category",      limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "eventdatetime"
    t.text     "venue",         limit: 65535
    t.string   "image1",        limit: 255
  end

end
