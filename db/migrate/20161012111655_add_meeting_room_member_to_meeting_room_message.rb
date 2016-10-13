class AddMeetingRoomMemberToMeetingRoomMessage < ActiveRecord::Migration[5.0]
  def change
    add_reference :meeting_room_messages, :meeting_room_member, foreign_key: true
  end
end
