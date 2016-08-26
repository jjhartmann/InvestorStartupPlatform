class CreateTargetFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :target_followers do |t|
      t.integer :follower_id
      t.string :follower_type
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
  end
end
