class RemoveFieldsFromMeetingMember < ActiveRecord::Migration[5.0]
  def change
    remove_column :meeting_members, :is_accepted, :boolean
    add_column :meeting_members, :acceptance_status, :string
  end
end
