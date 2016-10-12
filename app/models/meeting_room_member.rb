class MeetingRoomMember < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :meetable, polymorphic: true
  has_many :meeting_room_messages
end
