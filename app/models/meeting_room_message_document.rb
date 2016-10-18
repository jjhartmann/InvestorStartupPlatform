class MeetingRoomMessageDocument < ApplicationRecord
  belongs_to :meeting_room_message

  mount_uploader :document, DocumentUploader

  validates :document, presence: true
end
