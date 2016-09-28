class ChangeDefaultTypeOfIsViewedInNotification < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:notifications, :is_viewed, false)
  end
end
