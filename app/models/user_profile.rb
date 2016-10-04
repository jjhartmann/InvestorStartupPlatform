class UserProfile < ApplicationRecord
  include RailsAdmin::UserProfileAdmin
  include RailsAdminCharts

  has_one :user, :as => :profilable
  has_one :questionaire, :as => :questionable
  has_many :notifications, :as => :notificable
  has_many :meeting_members, :as => :memberable

  validates :profession,        :presence     => true,
            :length       => { :within => 1..140 }, on: :update
  validates :industry, :presence     => true,
            :length       => { :within => 1..140 }, on: :update
end
