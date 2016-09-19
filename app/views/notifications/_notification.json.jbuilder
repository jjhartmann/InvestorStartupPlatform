json.extract! notification, :id, :notificable_id, :notificable_type, :notification_text, :is_viewed, :created_at, :updated_at
json.url notification_url(notification, format: :json)