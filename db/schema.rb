# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_710_024_413) do
  create_table 'followings', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followed_user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['followed_user_id'], name: 'index_followings_on_followed_user_id'
    t.index %w[follower_id followed_user_id], name: 'index_followings_on_follower_id_and_followed_user_id',
                                              unique: true
    t.index ['follower_id'], name: 'index_followings_on_follower_id'
  end

  create_table 'sleep_records', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'asleep_at'
    t.datetime 'awake_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
