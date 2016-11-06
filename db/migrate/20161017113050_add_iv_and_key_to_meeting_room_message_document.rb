class AddIvAndKeyToMeetingRoomMessageDocument < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_room_message_documents, :iv, :binary
    add_column :meeting_room_message_documents, :key, :binary
  end
end
