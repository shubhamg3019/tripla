# frozen_string_literal: true

FactoryBot.define do
  factory :sleep_record do
    user_id { 1 }
    asleep_at { '2023-07-10 08:13:55' }
    awake_at { '2023-07-10 08:13:55' }
  end
end
