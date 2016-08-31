class UserProfile < ApplicationRecord
  has_one :user, :as => :profilable

  validates :profession,        :presence     => true,
            :length       => { :within => 1..140 }
  validates :industry, :presence     => true,
            :length       => { :within => 1..140 }
end
