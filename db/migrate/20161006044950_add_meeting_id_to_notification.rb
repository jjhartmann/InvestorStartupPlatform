class AddMeetingIdToNotification < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :meeting, foreign_key: true
  end
end
