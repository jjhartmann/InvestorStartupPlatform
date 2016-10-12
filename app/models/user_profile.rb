class UserProfile < ApplicationRecord
  include RailsAdmin::UserProfileAdmin
  include RailsAdminCharts

  has_one  :user,                 :as => :profilable
  has_one  :questionaire,         :as => :questionable
  has_many :notifications,        :as => :notificable
  has_many :meeting_members,      :as => :memberable
  has_many :meetings,             :through => :meeting_members

  has_many :meeting_room_members, :as => :meetable
  has_many :meeting_rooms,        :through => :meeting_room_members

  validates :profession,       :presence     => true,
            :length       => { :within => 1..140 }, on: :update
  validates :industry, :presence     => true,
            :length       => { :within => 1..140 }, on: :update
end
