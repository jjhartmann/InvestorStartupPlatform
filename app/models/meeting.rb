class Meeting < ApplicationRecord
  belongs_to :enterprise
  belongs_to :investor_profile
  has_many :meeting_members
  has_many :notifications, :as => :notificable
  has_one :meeting_room

end
