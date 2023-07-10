# frozen_string_literal: true

class CreateJoinTableFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :followings do |t|
      t.integer :follower_id
      t.integer :followed_user_id

      t.timestamps
    end

    add_index :followings, :follower_id
    add_index :followings, :followed_user_id
    add_index :followings, %i[follower_id followed_user_id], unique: true
  end
end
