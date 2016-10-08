class CreateAdminMeetingSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_meeting_schedules do |t|
      t.references :user, foreign_key: true
      t.string :day
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
