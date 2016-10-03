class AddIsAcceptedFieldToMeetingMember < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_members, :is_accepted, :boolean, default: false
  end
end
