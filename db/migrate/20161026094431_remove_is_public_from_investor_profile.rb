class RemoveIsPublicFromInvestorProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :investor_profiles, :is_public, :boolean
  end
end
