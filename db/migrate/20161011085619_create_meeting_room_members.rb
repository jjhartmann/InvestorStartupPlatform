class CreateMeetingRoomMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_room_members do |t|
      t.references :meeting_room, foreign_key: true
      t.integer :meetable_id
      t.string :meetable_type

      t.timestamps
    end
  end
end
