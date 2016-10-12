class RemoveFieldFromMeetingMember < ActiveRecord::Migration[5.0]
  def change
    remove_column :meeting_members, :acceptance_status, :string
    add_column    :meetings, :acceptance_status, :string
    add_column    :meetings, :accepted_by, :integer, class_name: "User", foreign_key: true
  end
end
