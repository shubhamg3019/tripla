# frozen_string_literal: true

module Api
  module V1
    class SleepRecordsController < ApplicationController
      def clock_in
        user = User.find(params[:user_id])
        sleep_record = user.sleep_records.create(asleep_at: DateTime.current)
        render json: sleep_record, status: :created
      end

      def wake_up
        sleep_record = SleepRecord.find(params[:id])
        sleep_record.update(awake_at: DateTime.current)
        render json: sleep_record
      end

      def index
        sleep_records = SleepRecord.order(created_at: :asc)
        render json: sleep_records
      end

      def following_sleep_records
        user = User.find(params[:user_id])
        followed_users_ids = user.followings.pluck(:followed_user_id)
        sleep_records = SleepRecord.where(user_id: followed_users_ids)
                                   .previous_week
                                   .sort_by { |record| (record.awake_at.to_i - record.asleep_at.to_i) }
        render json: sleep_records
      end
    end
  end
end
