class MeetingRoom < ApplicationRecord
  belongs_to :meeting
  has_many :meeting_room_members
end