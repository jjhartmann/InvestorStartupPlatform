class Notification < ApplicationRecord
  include Timming

  #Associations
  belongs_to :notificable
  belongs_to :user
  belongs_to :meeting

  #Validations
  validates :notification_text, presence: true

  def is_accepted(current_user)
    meeting.meeting_members.find_by(memberable: current_user).is_accepted if meeting_id.present?
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
