class Notification < ApplicationRecord
  belongs_to :notificable
  validates :notification_text, presence: true


  protected
  
  class << self
    def create_notification(target_id, target_type, text)
      self.create(:notificable_id => target_id,
                  :notificable_type => target_type,
                  :notification_text => text
                  )
    end
  end

end
