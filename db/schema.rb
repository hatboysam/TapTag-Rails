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

ActiveRecord::Schema.define(:version => 20120822192304) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "category"
  end

  create_table "orders", :force => true do |t|
    t.integer  "company_id"
    t.integer  "vendor_id"
    t.boolean  "paid"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "redemptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "vendor_id"
    t.integer  "reward_id"
    t.integer  "taps"
    t.date     "redeemed_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rewards", :force => true do |t|
    t.string   "action"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "time_sensitive"
    t.integer  "actions_needed"
    t.boolean  "repeats"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "name"
    t.string   "description"
  end

  create_table "taps", :force => true do |t|
    t.integer  "vendor_id"
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "tapped_time"
    t.date     "tapped_date"
  end

  create_table "users", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "facebook"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api"
  end

  create_table "vendors", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.decimal  "lat"
    t.decimal  "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
