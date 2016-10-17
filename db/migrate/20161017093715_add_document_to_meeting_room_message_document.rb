class AddDocumentToMeetingRoomMessageDocument < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_room_message_documents, :document, :string
  end
end
