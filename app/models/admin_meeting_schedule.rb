class AdminMeetingSchedule < ApplicationRecord
  include RailsAdmin::AdminMeetingScheduleAdmin
  belongs_to :user


end
