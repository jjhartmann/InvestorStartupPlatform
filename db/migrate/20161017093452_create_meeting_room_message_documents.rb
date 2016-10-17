class CreateMeetingRoomMessageDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_room_message_documents do |t|
      t.references :meeting_room_message, foreign_key: true

      t.timestamps
    end
  end
end
