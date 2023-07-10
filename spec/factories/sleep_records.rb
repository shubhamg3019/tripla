# frozen_string_literal: true

FactoryBot.define do
  factory :sleep_record do
    association :user
    asleep_at { Faker::Time.between(from: 1.week.ago, to: Time.current) }
    awake_at { Faker::Time.between(from: asleep_at, to: Time.current) }
  end
end
