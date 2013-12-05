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

ActiveRecord::Schema.define(:version => 20130913121019) do

  create_table "attends", :force => true do |t|
    t.integer  "course_id",  :null => false
    t.integer  "student_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description", :null => false
    t.date     "founded_in",  :null => false
    t.string   "company_url", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name",           :null => false
    t.integer  "company_id",     :null => false
    t.datetime "course_date",    :null => false
    t.integer  "student_amount", :null => false
    t.string   "location",       :null => false
    t.text     "agenda",         :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "courses", ["name"], :name => "index_courses_on_name"

  create_table "students", :force => true do |t|
    t.text     "description", :null => false
    t.integer  "user_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teachers", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "company_id",  :null => false
    t.text     "description", :null => false
    t.string   "position",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                               :null => false
    t.string   "phone",                                  :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
