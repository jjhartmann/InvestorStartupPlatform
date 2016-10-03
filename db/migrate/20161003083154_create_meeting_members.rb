class CreateMeetingMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_members do |t|
      t.references :meeting, foreign_key: true
      t.integer :memberable_id
      t.string :memberable_type

      t.timestamps
    end
  end
end
