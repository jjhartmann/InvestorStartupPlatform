class MeetingRoomMessage < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :meeting_room_member
  belongs_to :message
end
