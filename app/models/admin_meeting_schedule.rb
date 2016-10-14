class AdminMeetingSchedule < ApplicationRecord
  include RailsAdmin::AdminMeetingScheduleAdmin
  belongs_to :investor_profile


  before_create :set_end_time
  before_update :set_end_time


  # Set end time for the meeting schedule created from the seed file.
  def set_end_time
    self.end_time = self.start_time + 1.day
  end
end
