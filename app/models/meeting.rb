class Meeting < ApplicationRecord
  belongs_to :enterprise
  belongs_to :user
  has_many :meeting_members
  has_many :notifications, :as => :notificable
end
