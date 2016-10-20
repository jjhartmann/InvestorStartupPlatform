class MeetingRoom < ApplicationRecord
  belongs_to :meeting
  has_many :meeting_room_members, dependent: :destroy
  has_many :meeting_room_messages, dependent: :destroy
end
