require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:sleep_records).dependent(:destroy) }
    it { should have_and_belong_to_many(:followings).class_name('User') }
    it { should have_and_belong_to_many(:followers).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe '#following_sleep_records' do
    let(:user) { create(:user) }
    let(:followed_user1) { create(:user) }
    let(:followed_user2) { create(:user) }
    let!(:sleep_record1) { create(:sleep_record, user: followed_user1) }
    let!(:sleep_record2) { create(:sleep_record, user: followed_user2) }
    let!(:sleep_record3) { create(:sleep_record, user: user) }

    before do
      user.followings << followed_user1
      user.followings << followed_user2
    end

    it 'returns sleep records of followed users' do
      expect(user.following_sleep_records).to match_array([sleep_record1, sleep_record2])
    end

    it 'includes sleep records through eager loading' do
      expect(user.following_sleep_records.first.user).to eq(followed_user1)
    end
  end
end
