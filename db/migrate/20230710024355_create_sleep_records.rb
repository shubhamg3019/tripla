# frozen_string_literal: true

class CreateSleepRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :sleep_records do |t|
      t.integer :user_id
      t.datetime :asleep_at
      t.datetime :awake_at

      t.timestamps
    end
  end
end
