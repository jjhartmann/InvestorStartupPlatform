class InvestorProfile < ApplicationRecord
  include RailsAdmin::InvestorProfileAdmin
  include RailsAdminCharts

  has_one :user, :as => :profilable
  has_one :questionaire, :as => :questionable
  has_many :notifications, :as => :notificable
  has_many :meeting_members, :as => :memberable
  has_many :meetings
  has_many :admin_meeting_schedules

  has_many :meeting_room_members, :as => :meetable
  has_many :meeting_rooms, :through => :meeting_room_members

  validates :tagline,        :presence     => true,
            :length       => { :within => 10..140 }
  validates :funds_to_offer, :presence     => true,
            :numericality => true


  def is_featured?
    false
  end
end
