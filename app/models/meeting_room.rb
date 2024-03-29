class MeetingRoom < ApplicationRecord
  belongs_to :meeting
  has_many :meeting_room_members, dependent: :destroy
  has_many :meeting_room_messages, dependent: :destroy


  def time_range
    return meeting.start_time < DateTime.now && meeting.end_time > DateTime.now
  end
end
