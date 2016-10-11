class RemoveUserFromMeeting < ActiveRecord::Migration[5.0]
  def change
    remove_reference :meetings, :user
  end
end
