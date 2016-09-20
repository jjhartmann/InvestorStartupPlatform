class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :notificable_id
      t.string :notificable_type
      t.string :notification_text
      t.string :is_viewed

      t.timestamps
    end
  end
end
Contact GitHub API Training Shop Blog About
