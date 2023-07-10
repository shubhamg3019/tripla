# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def follow
        user = User.find(params[:id])
        followed_user = User.find(params[:followed_user_id])
        user.followings << followed_user
        head :no_content
      end

      def unfollow
        user = User.find(params[:id])
        followed_user = User.find(params[:followed_user_id])
        user.followings.delete(followed_user)
        head :no_content
      end
    end
  end
end
