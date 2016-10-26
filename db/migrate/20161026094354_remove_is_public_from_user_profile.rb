class RemoveIsPublicFromUserProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_profiles, :is_public, :boolean
  end
end
