# frozen_string_literal: true

class SleepRecord < ApplicationRecord
  belongs_to :user

  validates :asleep_at, presence: true

  scope :previous_week, -> { where(asleep_at: 1.week.ago.beginning_of_day..Time.current) }
  scope :sorted_by_duration, -> { order(Arel.sql('awake_at - asleep_at DESC')) }
end
