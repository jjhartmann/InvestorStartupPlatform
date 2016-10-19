class ChangeDataTypeInMeetingRoomMessageDocument < ActiveRecord::Migration[5.0]
  def up
    change_column :meeting_room_message_documents, :iv, :binary
    change_column :meeting_room_message_documents, :key, :binary

  end
  def down
    change_column :meeting_room_message_documents, :iv, :boolean
    change_column :meeting_room_message_documents, :key, :boolean
  end
end
