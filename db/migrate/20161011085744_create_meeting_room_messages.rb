class CreateMeetingRoomMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_room_messages do |t|
      t.references :meeting_room, foreign_key: true
      t.references :meeting_member, foreign_key: true
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
