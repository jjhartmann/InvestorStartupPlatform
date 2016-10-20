class AddIsPublicToUserProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :user_profiles, :is_public, :boolean, default: true
  end
end
