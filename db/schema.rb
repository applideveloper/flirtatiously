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

ActiveRecord::Schema.define(:version => 20140219005715) do

  create_table "acceptable_responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "answer_choice_id"
    t.integer  "importance"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "question_id"
  end

  add_index "acceptable_responses", ["answer_choice_id"], :name => "index_acceptable_responses_on_answer_choice_id"
  add_index "acceptable_responses", ["question_id"], :name => "index_acceptable_responses_on_question_id"
  add_index "acceptable_responses", ["user_id", "answer_choice_id"], :name => "index_acceptable_responses_on_user_id_and_answer_choice_id", :unique => true
  add_index "acceptable_responses", ["user_id"], :name => "index_acceptable_responses_on_user_id"

  create_table "answer_choices", :force => true do |t|
    t.integer  "question_id"
    t.string   "text"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answer_choices", ["question_id"], :name => "index_answer_choices_on_question_id"

  create_table "likes", :force => true do |t|
    t.integer  "liker_id"
    t.integer  "likee_id"
    t.boolean  "is_mutual"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "likes", ["likee_id"], :name => "index_likes_on_likee_id"
  add_index "likes", ["liker_id"], :name => "index_likes_on_liker_id"

  create_table "message_headers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "other_id"
    t.integer  "message_id"
    t.boolean  "is_sent"
    t.boolean  "is_read",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "message_headers", ["message_id"], :name => "index_message_headers_on_message_id"
  add_index "message_headers", ["other_id"], :name => "index_message_headers_on_other_id"
  add_index "message_headers", ["user_id"], :name => "index_message_headers_on_user_id"

  create_table "messages", :force => true do |t|
    t.text     "body",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profile_views", :force => true do |t|
    t.integer  "viewer_id"
    t.integer  "viewee_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "profile_views", ["viewee_id"], :name => "index_profile_views_on_viewee_id"
  add_index "profile_views", ["viewer_id"], :name => "index_profile_views_on_viewer_id"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "sex"
    t.string   "sexual_orientation"
    t.string   "drugs"
    t.text     "description"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "height"
    t.string   "body_type"
    t.string   "diet"
    t.string   "smokes"
    t.string   "drinks"
    t.string   "religion"
    t.string   "sign"
    t.string   "education"
    t.string   "job"
    t.string   "offspring"
    t.string   "pets"
    t.text     "likes"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "zip_code"
    t.string   "city"
    t.date     "birthday",               :null => false
    t.string   "big_photo_file_name"
    t.string   "big_photo_content_type"
    t.integer  "big_photo_file_size"
    t.datetime "big_photo_updated_at"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "questions", :force => true do |t|
    t.string   "category"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "answer_choice_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "question_id"
  end

  add_index "responses", ["answer_choice_id"], :name => "index_responses_on_answer_choice_id"
  add_index "responses", ["user_id", "question_id"], :name => "index_responses_on_user_id_and_question_id", :unique => true
  add_index "responses", ["user_id"], :name => "index_responses_on_user_id"

  create_table "status_messages", :force => true do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "status_messages", ["user_id"], :name => "index_status_messages_on_user_id"

  create_table "user_filters", :force => true do |t|
    t.integer  "user_id"
    t.integer  "beg_age",            :default => 18
    t.integer  "end_age",            :default => 99
    t.string   "sex",                :default => "Everyone"
    t.string   "sexual_orientation", :default => "All"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "distance",           :default => 6969
  end

  add_index "user_filters", ["user_id"], :name => "index_user_filters_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
