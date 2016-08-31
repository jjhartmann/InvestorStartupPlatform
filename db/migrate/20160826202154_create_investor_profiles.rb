class CreateInvestorProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :investor_profiles do |t|
      t.string :tagline
      t.integer :funds_to_offer
      t.text :description

      t.timestamps default: Time.now
    end

  end
end
