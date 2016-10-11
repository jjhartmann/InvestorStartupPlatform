json.extract! meeting_room_message, :id, :meeting_room_id, :meeting_member_id, :message_id, :created_at, :updated_at
json.url meeting_room_message_url(meeting_room_message, format: :json)