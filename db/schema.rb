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

ActiveRecord::Schema.define(version: 20160721043415) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payment_line_items", force: :cascade do |t|
    t.integer  "payment_id"
    t.string   "buyable_type"
    t.integer  "buyable_id"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["buyable_type", "buyable_id"], name: "index_payment_line_items_on_buyable_type_and_buyable_id"
    t.index ["payment_id"], name: "index_payment_line_items_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.integer  "status"
    t.string   "reference"
    t.string   "payment_method"
    t.string   "response_id"
    t.text     "full_response"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["reference"], name: "index_payments_on_reference"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "performances", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_performances_on_event_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "performance_id"
    t.integer  "status"
    t.integer  "access"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.string   "reference"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["performance_id"], name: "index_tickets_on_performance_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
