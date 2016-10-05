class Notification < ApplicationRecord
  include Timming
  belongs_to :notificable
  belongs_to :user
  validates :notification_text, presence: true


  protected

  class << self
    def create_notification(target_id, target_type, text, type)
      self.create(:notificable_id => target_id,
                  :notificable_type => target_type,
                  :notification_text => text,
                  :notification_type => type
                  )
    end
  end

end
