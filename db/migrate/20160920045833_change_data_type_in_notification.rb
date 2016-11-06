class ChangeDataTypeInNotification < ActiveRecord::Migration[5.0]
  def up
    change_column :notifications, :is_viewed, 'boolean USING CAST(is_viewed AS boolean)'
  end

  def down
    change_column :notifications, :is_viewed, :string
  end
end
