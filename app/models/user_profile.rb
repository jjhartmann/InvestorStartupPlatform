class UserProfile < ApplicationRecord
  include RailsAdmin::UserProfileAdmin
  include RailsAdminCharts

  has_one :user, :as => :profilable
  has_one :questionaire, :as => :questionable
  has_many :notifications, :as => :notificable

  validates :profession,        :presence     => true,
            :length       => { :within => 1..140 }
  validates :industry, :presence     => true,
            :length       => { :within => 1..140 }
end
