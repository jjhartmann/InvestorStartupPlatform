class ChangeDataTypeInMeetingRoomMessageDocument < ActiveRecord::Migration[5.0]
  def up
    change_column :meeting_room_message_documents, :iv, 'bytea USING CAST(iv AS bytea)'
    change_column :meeting_room_message_documents, :key, 'boolean USING CAST(key AS bytea)'

  end
  def down
    change_column :meeting_room_message_documents, :iv, :boolean
    change_column :meeting_room_message_documents, :key, :boolean
  end
end
