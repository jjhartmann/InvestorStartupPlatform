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

ActiveRecord::Schema.define(version: 20160828040415) do

  create_table "enterprise_photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "photo"
    t.integer  "enterprise_id"
    t.datetime "created_at",    default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",    default: '2016-08-31 02:59:48', null: false
    t.index ["enterprise_id"], name: "index_enterprise_photos_on_enterprise_id", using: :btree
  end

  create_table "enterprise_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "enterprise_id"
    t.string   "user_email"
    t.string   "role_identifier"
    t.string   "member_title",    default: ""
    t.boolean  "confirmed",       default: false
    t.datetime "created_at",      default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",      default: '2016-08-31 02:59:48', null: false
    t.index ["confirmed"], name: "index_enterprise_users_on_confirmed", using: :btree
    t.index ["enterprise_id", "confirmed"], name: "index_enterprise_users_on_enterprise_id_and_confirmed", using: :btree
    t.index ["enterprise_id", "user_email"], name: "index_enterprise_users_on_enterprise_id_and_user_email", using: :btree
    t.index ["enterprise_id"], name: "index_enterprise_users_on_enterprise_id", using: :btree
    t.index ["user_email"], name: "index_enterprise_users_on_user_email", using: :btree
  end

  create_table "enterprises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "pitch",             limit: 65535
    t.integer  "funds_to_raise"
    t.string   "industry"
    t.string   "enterprise_stage"
    t.string   "stage_identifier"
    t.string   "market_identifier"
    t.string   "location"
    t.text     "description",       limit: 65535
    t.string   "logo"
    t.integer  "follower_count",                  default: 0
    t.integer  "followed_count",                  default: 0
    t.integer  "comment_count",                   default: 0
    t.datetime "created_at",                      default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",                      default: '2016-08-31 02:59:48', null: false
    t.index ["location"], name: "index_enterprises_on_location", using: :btree
    t.index ["market_identifier", "location"], name: "index_enterprises_on_market_identifier_and_location", using: :btree
    t.index ["name"], name: "index_enterprises_on_name", unique: true, using: :btree
  end

  create_table "investor_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tagline"
    t.integer  "funds_to_offer"
    t.text     "description",    limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",                   default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",                   default: '2016-08-31 02:59:48', null: false
    t.index ["user_id"], name: "index_investor_profiles_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",     limit: 65535
    t.boolean  "is_read",                   default: false
    t.boolean  "is_private",                default: false
    t.boolean  "is_archived",               default: false
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.integer  "topic_id"
    t.datetime "created_at",                default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",                default: '2016-08-31 02:59:48', null: false
    t.index ["is_private", "target_type", "target_id"], name: "comments_by_type", using: :btree
    t.index ["is_read", "is_private", "target_type", "target_id"], name: "comments_by_type_by_read", using: :btree
    t.index ["topic_id"], name: "index_messages_on_topic_id", using: :btree
    t.index ["user_id", "is_private", "is_archived", "proposal_id"], name: "comments_by_archived_by_proposal", using: :btree
    t.index ["user_id", "is_private", "target_type", "target_id"], name: "comments_by_type_by_user", using: :btree
    t.index ["user_id", "proposal_id"], name: "index_messages_on_user_id_and_proposal_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "proposal_for_investors", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at",  default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",  default: '2016-08-31 02:59:48', null: false
    t.index ["proposal_id", "user_id"], name: "index_proposal_for_investors_on_proposal_id_and_user_id", using: :btree
    t.index ["proposal_id"], name: "index_proposal_for_investors_on_proposal_id", using: :btree
    t.index ["user_id"], name: "index_proposal_for_investors_on_user_id", using: :btree
  end

  create_table "proposals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "proposal_stage_identifier"
    t.boolean  "new_business_model",                                 default: false
    t.boolean  "new_product",                                        default: false
    t.text     "pitch",                                limit: 65535
    t.text     "introduction",                         limit: 65535
    t.text     "one_year_target_audience",             limit: 65535
    t.integer  "one_year_per_capita_annual_spending",                default: 0
    t.integer  "one_year_number_of_users",                           default: 0
    t.integer  "one_year_market_cap",                                default: 0
    t.integer  "one_year_penetration_rate",                          default: 0
    t.text     "one_year_marketing_strategy",          limit: 65535
    t.integer  "one_year_gross_profit_margin",                       default: 0
    t.text     "five_year_target_audience",            limit: 65535
    t.integer  "five_year_per_capita_annual_spending",               default: 0
    t.integer  "five_year_number_of_users",                          default: 0
    t.integer  "five_year_market_cap",                               default: 0
    t.integer  "five_year_penetration_rate",                         default: 0
    t.text     "five_year_marketing_strategy",         limit: 65535
    t.integer  "five_year_gross_profit_margin",                      default: 0
    t.text     "competitors_details",                  limit: 65535
    t.text     "competitive_edges",                    limit: 65535
    t.text     "competing_strategy",                   limit: 65535
    t.integer  "investment_amount",                                  default: 0
    t.string   "investment_currency"
    t.integer  "equity_percentage",                                  default: 0
    t.text     "spending_plan",                        limit: 65535
    t.integer  "next_investment_round",                              default: 0
    t.integer  "enterprise_id"
    t.datetime "created_at",                                         default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",                                         default: '2016-08-31 02:59:48', null: false
    t.index ["enterprise_id"], name: "index_proposals_on_enterprise_id", using: :btree
    t.index ["proposal_stage_identifier"], name: "index_proposals_on_proposal_stage_identifier", using: :btree
  end

  create_table "quesitons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "question",   limit: 65535
    t.text     "answer",     limit: 65535
    t.string   "category"
    t.datetime "created_at",               default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",               default: '2016-08-31 02:59:48', null: false
  end

  create_table "questionaires", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "instruction",       limit: 65535
    t.text     "disclaimer",        limit: 65535
    t.string   "questionable_type"
    t.integer  "questionable_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["questionable_type", "questionable_id"], name: "index_questionaires_on_questionable_type_and_questionable_id", using: :btree
  end

  create_table "target_followers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "follower_id"
    t.string   "follower_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",    default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",    default: '2016-08-31 02:59:48', null: false
    t.index ["follower_id", "target_type", "target_id"], name: "target_followers_follwer", unique: true, using: :btree
    t.index ["follower_id"], name: "index_target_followers_on_follower_id", using: :btree
    t.index ["follower_type", "follower_id", "target_type", "target_id"], name: "target_followers_follwer_with_type", unique: true, using: :btree
    t.index ["follower_type", "follower_id"], name: "index_target_followers_on_follower_type_and_follower_id", using: :btree
    t.index ["target_id"], name: "index_target_followers_on_target_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_target_followers_on_target_type_and_target_id", using: :btree
  end

  create_table "user_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "industry"
    t.string   "profession"
    t.text     "skills",         limit: 65535
    t.text     "something_cool", limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",                   default: '2016-08-31 02:59:48', null: false
    t.datetime "updated_at",                   default: '2016-08-31 02:59:48', null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "name"
    t.string   "location",               default: ""
    t.string   "introduction",           default: ""
    t.integer  "followers_count",        default: 0
    t.integer  "followed_count",         default: 0
    t.integer  "messages_count",         default: 0
    t.integer  "comments_count",         default: 0
    t.boolean  "is_admin",               default: false
    t.string   "profilable_type"
    t.integer  "profilable_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["is_admin"], name: "index_users_on_is_admin", using: :btree
    t.index ["location"], name: "index_users_on_location", using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["profilable_type", "profilable_id"], name: "index_users_on_profilable_type_and_profilable_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
