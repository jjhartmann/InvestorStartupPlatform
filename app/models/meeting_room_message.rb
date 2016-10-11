class MeetingRoomMessage < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :meeting_member
  belongs_to :message
end
