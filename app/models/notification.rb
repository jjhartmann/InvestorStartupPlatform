class Notification < ApplicationRecord
  belongs_to :notificable
  validates :notification_text, presence: true
end
