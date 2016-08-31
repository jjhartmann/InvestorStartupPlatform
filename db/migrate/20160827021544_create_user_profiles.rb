class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.string :industry
      t.string :profession
      t.text :skills
      t.text :something_cool

      t.timestamps :default => Time.now
    end

  end
end
