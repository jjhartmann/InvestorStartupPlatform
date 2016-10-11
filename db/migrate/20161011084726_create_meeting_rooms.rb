class CreateMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_rooms do |t|
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
