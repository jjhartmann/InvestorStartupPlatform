class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :location, :default => ''
      t.string :introduction, :default => ''
      t.integer :followers_count, :default => 0
      t.integer :followed_count, :default => 0
      t.integer :messages_count, :default => 0
      t.integer :comments_count, :default => 0
      t.boolean :is_admin, :default => false

      ## References for profile
      t.string  :profilable_type, :default => nil
      t.integer :profilable_id, :default => nil

      t.timestamps null: false
    end

    add_index :users, [:profilable_type, :profilable_id]
    add_index :users, :username,             :unique   => true
    add_index :users, :name
    add_index :users, :location
    add_index :users, :is_admin
  end
end
