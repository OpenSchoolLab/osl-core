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

ActiveRecord::Schema.define(version: 20170525174019) do

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean  "voided",                      default: false, null: false
    t.integer  "voided_by"
    t.integer  "created_by",                                  null: false
    t.text     "voided_reason", limit: 65535
    t.string   "uuid",          limit: 36,    default: "",    null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["created_by"], name: "fk_rails_0f8e176189", using: :btree
    t.index ["voided_by"], name: "fk_rails_a6e182138c", using: :btree
  end

  create_table "person_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "gender"
    t.datetime "date_of_birth"
    t.boolean  "voided",                      default: false, null: false
    t.integer  "voided_by"
    t.integer  "created_by",                                  null: false
    t.text     "voided_reason", limit: 65535
    t.string   "uuid",          limit: 36,    default: "",    null: false
    t.integer  "person_id",                                   null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["created_by"], name: "fk_rails_c89a0edde5", using: :btree
    t.index ["person_id"], name: "index_person_details_on_person_id", using: :btree
    t.index ["voided_by"], name: "fk_rails_158df02ab4", using: :btree
  end

  create_table "person_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "voided",                      default: false, null: false
    t.integer  "voided_by"
    t.integer  "created_by",                                  null: false
    t.text     "voided_reason", limit: 65535
    t.string   "uuid",          limit: 36,    default: "",    null: false
    t.integer  "person_id",                                   null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["created_by"], name: "fk_rails_74a0551962", using: :btree
    t.index ["person_id"], name: "index_person_names_on_person_id", using: :btree
    t.index ["voided_by"], name: "fk_rails_632f6401a5", using: :btree
  end

  create_table "person_role_maps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "role_id",                                     null: false
    t.integer  "person_id",                                   null: false
    t.boolean  "voided",                      default: false, null: false
    t.integer  "voided_by"
    t.integer  "created_by",                                  null: false
    t.text     "voided_reason", limit: 65535
    t.string   "uuid",          limit: 36,    default: "",    null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["created_by"], name: "fk_rails_36d5072ee9", using: :btree
    t.index ["person_id"], name: "index_person_role_maps_on_person_id", using: :btree
    t.index ["role_id"], name: "index_person_role_maps_on_role_id", using: :btree
    t.index ["voided_by"], name: "fk_rails_48e9393673", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                        null: false
    t.boolean  "voided",                      default: false, null: false
    t.integer  "voided_by"
    t.integer  "created_by",                                  null: false
    t.text     "voided_reason", limit: 65535
    t.string   "uuid",          limit: 36,    default: "",    null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["created_by"], name: "fk_rails_c0bcb5f815", using: :btree
    t.index ["voided_by"], name: "fk_rails_f81e95d70c", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider",                             default: "email", null: false
    t.string   "uid",                                  default: "",      null: false
    t.string   "encrypted_password",                   default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",                             default: "",      null: false
    t.string   "secret_question"
    t.string   "secret_answer"
    t.string   "email"
    t.string   "uuid",                   limit: 36,    default: "",      null: false
    t.text     "tokens",                 limit: 65535
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
    t.index ["uuid"], name: "index_users_on_uuid", unique: true, using: :btree
  end

  add_foreign_key "people", "users", column: "created_by"
  add_foreign_key "people", "users", column: "voided_by"
  add_foreign_key "person_details", "people"
  add_foreign_key "person_details", "users", column: "created_by"
  add_foreign_key "person_details", "users", column: "voided_by"
  add_foreign_key "person_names", "people"
  add_foreign_key "person_names", "users", column: "created_by"
  add_foreign_key "person_names", "users", column: "voided_by"
  add_foreign_key "person_role_maps", "people"
  add_foreign_key "person_role_maps", "users", column: "created_by"
  add_foreign_key "person_role_maps", "users", column: "voided_by"
  add_foreign_key "roles", "users", column: "created_by"
  add_foreign_key "roles", "users", column: "voided_by"
end
