class Meeting < ApplicationRecord
  include RailsAdmin::MeetingAdmin

  belongs_to :enterprise
  belongs_to :investor_profile
  has_many :meeting_members
  has_many :notifications, :as => :notificable
  has_one :meeting_room

  before_create :set_end_time
  before_update :set_end_time


  # Set end time for the meeting schedule created from the seed file.
  def set_end_time
    self.end_time = self.start_time + 1.day
  end

end
