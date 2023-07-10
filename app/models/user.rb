# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sleep_records
  has_and_belongs_to_many :followings,
                          class_name: 'User',
                          join_table: :followings,
                          foreign_key: :follower_id,
                          association_foreign_key: :followed_user_id
  has_and_belongs_to_many :followers,
                          class_name: 'User',
                          join_table: :followings,
                          foreign_key: :followed_user_id,
                          association_foreign_key: :follower_id
  validates :name, presence: true

  def following_sleep_records
    User.includes(:sleep_records).where(id: followings.select(:id)).flat_map(&:sleep_records)
  end
end
