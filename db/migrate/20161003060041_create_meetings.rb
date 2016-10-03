class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :topic
      t.datetime :start_time
      t.datetime :end_time
      t.references :enterprise, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
