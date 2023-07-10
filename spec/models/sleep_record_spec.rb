# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SleepRecord, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:asleep_at) }
  end

  describe 'scopes' do
    describe '.previous_week' do
      it 'returns sleep records within the previous week' do
        sleep_record1 = create(:sleep_record, asleep_at: 1.day.ago, awake_at: Time.current)
        sleep_record2 = create(:sleep_record, asleep_at: 2.weeks.ago, awake_at: Time.current)
        sleep_record3 = create(:sleep_record, asleep_at: 1.week.ago, awake_at: Time.current)

        expect(SleepRecord.previous_week).to match_array([sleep_record1, sleep_record3])
      end
    end

    describe '.sorted_by_duration' do
      it 'returns sleep records sorted by duration' do
        sleep_record1 = create(:sleep_record, asleep_at: 1.day.ago, awake_at: Time.current)
        sleep_record2 = create(:sleep_record, asleep_at: 2.days.ago, awake_at: 1.day.ago)
        sleep_record3 = create(:sleep_record, asleep_at: 3.days.ago, awake_at: 2.days.ago)

        expect(SleepRecord.sorted_by_duration).to eq([sleep_record1, sleep_record2, sleep_record3])
      end
    end
  end
end
