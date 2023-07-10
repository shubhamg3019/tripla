# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'POST /api/v1/users/:id/follow/:followed_user_id' do
    let(:user) { create(:user) }
    let(:followed_user) { create(:user) }

    it 'follows a user' do
      post "/api/v1/users/#{user.id}/follow/#{followed_user.id}"

      expect(response).to have_http_status(:no_content)
      expect(user.followings).to include(followed_user)
    end
  end

  describe 'DELETE /api/v1/users/:id/unfollow/:followed_user_id' do
    let(:user) { create(:user) }
    let(:followed_user) { create(:user) }

    before do
      user.followings << followed_user
    end

    it 'unfollows a user' do
      delete "/api/v1/users/#{user.id}/unfollow/#{followed_user.id}"

      expect(response).to have_http_status(:no_content)
      expect(user.followings).not_to include(followed_user)
    end
  end
end
