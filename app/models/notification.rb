class Notification < ApplicationRecord
  include Timming

  #Associations
  belongs_to :notificable
  belongs_to :user
  belongs_to :meeting

  #Validations
  validates :notification_text, presence: true

  def is_accepted(current_user)
    meeting_id.present? ? (meeting.acceptance_status ? true : false) : false
  end

  protected

  class << self
    def create_notification(target_id, target_type, text, type, extras = {})
      self.create({:notificable_id => target_id,
                  :notificable_type => target_type,
                  :notification_text => text,
                  :notification_type => type
                }.merge(extras))
    end
  end

end
