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

ActiveRecord::Schema.define(version: 20171201122823) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "crypto_currencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "overview"
    t.text "description"
    t.string "symbol"
    t.string "purchasable_currency"
    t.date "released_at"
    t.string "white_paper"
    t.string "blog"
    t.string "fund_raised_amount"
    t.string "initial_price"
    t.string "platform"
    t.string "token_upper_limit"
    t.string "token_sale_supply_amount"
    t.string "key_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon_image_file_name"
    t.string "icon_image_content_type"
    t.integer "icon_image_file_size"
    t.datetime "icon_image_updated_at"
    t.string "slug"
    t.index ["slug"], name: "index_crypto_currencies_on_slug"
  end

  create_table "exchanges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "icon"
    t.string "overview"
    t.text "description"
    t.string "exchange_type"
    t.string "credit_transaction"
    t.string "futures_transaction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ticker_url"
    t.string "volume_key"
    t.string "bid_key"
    t.string "ask_key"
    t.string "icon_image_file_name"
    t.string "icon_image_content_type"
    t.integer "icon_image_file_size"
    t.datetime "icon_image_updated_at"
    t.string "key_name"
    t.string "slug"
    t.index ["slug"], name: "index_exchanges_on_slug"
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "relation_exchange_crypto_currencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exchange_id"
    t.bigint "crypto_currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crypto_currency_id"], name: "index_relation_exchange_crypto_currencies_on_crypto_currency_id"
    t.index ["exchange_id"], name: "index_relation_exchange_crypto_currencies_on_exchange_id"
  end

  create_table "tickers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "exchange_id"
    t.string "url"
    t.string "volume"
    t.string "bid"
    t.string "ask"
    t.string "market"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "relation_exchange_crypto_currencies", "crypto_currencies"
  add_foreign_key "relation_exchange_crypto_currencies", "exchanges"
end
