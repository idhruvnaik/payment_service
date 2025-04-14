# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_04_14_155801) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payment_methods", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "method_type"
    t.jsonb "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payment_methods_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "payment_method_id", null: false
    t.integer "amount"
    t.string "currency"
    t.string "status"
    t.string "transaction_id"
    t.string "idempotency_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idempotency_key"], name: "index_payments_on_idempotency_key"
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "payment_methods", "users"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "payments", "users"
end
