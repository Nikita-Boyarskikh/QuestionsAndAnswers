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

ActiveRecord::Schema.define(version: 20_171_221_010_635) do
  create_table 'answers', force: :cascade do |t|
    t.text 'text'
    t.integer 'rating'
    t.boolean 'is_best', default: false
    t.integer 'question_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'question_id'
    t.integer 'answer_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['answer_id'], name: 'index_likes_on_answer_id'
    t.index ['question_id'], name: 'index_likes_on_question_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
    t.index [nil], name: 'index_likes_on_answer'
    t.index [nil], name: 'index_likes_on_question'
    t.index [nil], name: 'index_likes_on_user'
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'title', limit: 30
    t.text 'text', null: false
    t.integer 'rating', default: 0
    t.integer 'tag_id'
    t.integer 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_questions_on_author_id'
    t.index ['tag_id'], name: 'index_questions_on_tag_id'
    t.index ['title'], name: 'index_questions_on_title'
    t.index [nil], name: 'index_questions_on_author'
    t.index [nil], name: 'index_questions_on_tag'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'title', limit: 255
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['title'], name: 'index_tags_on_title', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'nickname', default: '', null: false
    t.string 'fullname', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.datetime 'birthday'
    t.string 'avatar_url'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index %w[nickname encrypted_password], name: 'index_users_on_nickname_and_encrypted_password'
    t.index ['nickname'], name: 'index_users_on_nickname', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
