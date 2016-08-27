class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.string :industry
      t.string :profession
      t.text :skills
      t.text :something_cool
      t.integer :user_id

      t.timestamps :default => Time.now
    end

    add_index :user_profiles, :user_id
  end
end
