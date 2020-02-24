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

ActiveRecord::Schema.define(version: 20200221072617) do

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "movie_screen_id"
    t.integer  "booked_seats"
    t.float    "amount",          limit: 24
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["movie_screen_id"], name: "index_bookings_on_movie_screen_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "movie_screens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "movie_id"
    t.integer  "screen_id"
    t.date     "show_date"
    t.time     "show_time"
    t.float    "ticket_price",    limit: 24
    t.integer  "available_seats"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["movie_id"], name: "index_movie_screens_on_movie_id", using: :btree
    t.index ["screen_id"], name: "index_movie_screens_on_screen_id", using: :btree
  end

  create_table "movies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "movie_type"
    t.integer  "movie_status"
    t.datetime "release_date", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "screens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "theater_id"
    t.integer  "no_of_seats"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["theater_id"], name: "index_screens_on_theater_id", using: :btree
  end

  create_table "theaters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "street_name"
    t.string   "landmark"
    t.string   "city"
    t.string   "state"
    t.string   "pincode"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "gender"
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
