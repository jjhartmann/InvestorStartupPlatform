class AdminMeetingSchedule < ApplicationRecord
  include RailsAdmin::AdminMeetingScheduleAdmin
  belongs_to :user


  before_create :set_end_time


  # Set end time for the meeting schedule created from the seed file.
  def set_end_time
    self.end_time = self.start_time + 1.hour
  end
end
