class AddInvestorProfileToAdminMeetingSchedule < ActiveRecord::Migration[5.0]
  def change
    add_reference :admin_meeting_schedules, :investor_profile, foreign_key: true
  end
end
