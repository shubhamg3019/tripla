# frozen_string_literal: true

# Create dummy users
user1 = User.create(name: 'John')
user2 = User.create(name: 'Alice')
user3 = User.create(name: 'Bob')

# Create dummy sleep records
SleepRecord.create(user: user1, asleep_at: 1.day.ago, awake_at: Time.current)
SleepRecord.create(user: user2, asleep_at: 2.days.ago, awake_at: 1.day.ago)
SleepRecord.create(user: user3, asleep_at: 3.days.ago, awake_at: 2.days.ago)

# Set up user followings
user1.followings << user2
user1.followings << user3
