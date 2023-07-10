# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        post 'follow/:followed_user_id', action: :follow, on: :member
        delete 'unfollow/:followed_user_id', action: :unfollow, on: :member
      end
      resources :sleep_records, only: %i[create index] do
        post 'clock_in/:user_id', action: :clock_in, on: :collection
        patch 'wake_up/:id', action: :wake_up, on: :collection
        get 'following_sleep_records/:user_id', action: :following_sleep_records, on: :collection
      end
    end
  end
end
