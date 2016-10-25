class AddLatestMessageIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :latest_message_id, :integer, default: 0
  end
end
