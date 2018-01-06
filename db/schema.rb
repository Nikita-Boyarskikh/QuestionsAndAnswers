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

ActiveRecord::Schema.define(version: 20180105223959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "text"
    t.integer "rating", default: 0
    t.boolean "is_best", default: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_answers_on_author_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "avatars", force: :cascade do |t|
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "answer_id"
    t.bigint "author_id"
    t.integer "like", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_likes_on_answer_id"
    t.index ["author_id"], name: "index_likes_on_author_id"
    t.index ["question_id"], name: "index_likes_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "text", null: false
    t.integer "rating", default: 0
    t.integer "answers_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_questions_on_author_id"
    t.index ["title"], name: "index_questions_on_title"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title", limit: 255
    t.integer "questions_count", default: 0, null: false
    t.integer "answers_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_tags_on_title", unique: true
  end

  create_table "tags_info", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "question_id"
    t.bigint "answer_id"
    t.index ["answer_id"], name: "index_tags_info_on_answer_id"
    t.index ["question_id"], name: "index_tags_info_on_question_id"
    t.index ["tag_id"], name: "index_tags_info_on_tag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "nickname", null: false
    t.string "fullname", null: false
    t.string "encrypted_password", null: false
    t.datetime "birthday"
    t.bigint "avatar_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "questions_count", default: 0, null: false
    t.integer "answers_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname", "encrypted_password"], name: "index_users_on_nickname_and_encrypted_password"
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users", column: "author_id"
  add_foreign_key "likes", "answers"
  add_foreign_key "likes", "questions"
  add_foreign_key "questions", "users", column: "author_id"
  add_foreign_key "tags_info", "answers"
  add_foreign_key "tags_info", "questions"
  add_foreign_key "tags_info", "tags"
  add_foreign_key "users", "avatars"
end
