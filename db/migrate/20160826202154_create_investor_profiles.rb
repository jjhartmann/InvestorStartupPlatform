class CreateInvestorProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :investor_profiles do |t|
      t.string :tagline
      t.integer :funds_to_offer
      t.text :description
      t.integer :user_id

      t.timestamps default: Time.now
    end

    add_index :investor_profiles, :user_id
  end
end
