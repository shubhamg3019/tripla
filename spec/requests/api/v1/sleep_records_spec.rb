# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::SleepRecords', type: :request do
  describe 'POST /api/v1/sleep_records/clock_in/:user_id' do
    let(:user) { create(:user) }

    it 'creates a new sleep record' do
      post "/api/v1/sleep_records/clock_in/#{user.id}"

      expect(response).to have_http_status(:created)
      sleep_record = JSON.parse(response.body)
      expect(sleep_record['user_id']).to eq(user.id)
      expect(sleep_record['asleep_at']).not_to be_nil
    end
  end

  describe 'PATCH /api/v1/sleep_records/wake_up/:id' do
    let(:sleep_record) { create(:sleep_record) }

    it 'updates the awake_at time for a sleep record' do
      patch "/api/v1/sleep_records/wake_up/#{sleep_record.id}"

      expect(response).to have_http_status(:ok)
      updated_sleep_record = JSON.parse(response.body)
      expect(updated_sleep_record['awake_at']).not_to be_nil
    end
  end

  describe 'GET /api/v1/sleep_records' do
    let!(:sleep_record1) { create(:sleep_record) }
    let!(:sleep_record2) { create(:sleep_record) }

    it 'returns all sleep records ordered by created time' do
      get '/api/v1/sleep_records'

      expect(response).to have_http_status(:ok)
      sleep_records = JSON.parse(response.body)
      expect(sleep_records.count).to eq(2)
      expect(sleep_records.first['id']).to eq(sleep_record1.id)
      expect(sleep_records.second['id']).to eq(sleep_record2.id)
    end
  end

  describe 'GET /api/v1/sleep_records/following_sleep_records/:user_id' do
    let(:user) { create(:user) }
    let(:followed_user) { create(:user) }
    let!(:sleep_record1) { create(:sleep_record, user: followed_user) }
    let!(:sleep_record2) { create(:sleep_record, user: followed_user) }
    let!(:sleep_record3) { create(:sleep_record, user: user) }

    before do
      user.followings << followed_user
    end

    it 'returns sleep records of followed users from the previous week, sorted by duration' do
      get "/api/v1/sleep_records/following_sleep_records/#{user.id}"

      expect(response).to have_http_status(:ok)
      sleep_records = JSON.parse(response.body)
      expect(sleep_records.count).to eq(2)
      expect(sleep_records.first['id']).to eq(sleep_record1.id)
      expect(sleep_records.second['id']).to eq(sleep_record2.id)
    end
  end
end

