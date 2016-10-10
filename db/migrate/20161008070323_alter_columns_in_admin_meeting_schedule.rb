class AlterColumnsInAdminMeetingSchedule < ActiveRecord::Migration[5.0]
  def change
    change_column :admin_meeting_schedules, :start_time, :time
    change_column :admin_meeting_schedules, :end_time, :time
  end
end
