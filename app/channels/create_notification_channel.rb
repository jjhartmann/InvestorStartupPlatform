class CreateNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'new_create_notifications'
  end
end
