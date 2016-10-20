class Meeting < ApplicationRecord
  include RailsAdmin::MeetingAdmin

  belongs_to :enterprise
  belongs_to :investor_profile
  has_many :meeting_members, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_one :meeting_room, dependent: :destroy

  before_create :set_end_time
  before_update :set_end_time


  # Set end time for the meeting schedule created from the seed file.
  def set_end_time
    self.end_time = self.start_time + 1.day
  end

end
