class AddIsPublicToInvestorProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :investor_profiles, :is_public, :boolean, default: false
  end
end
