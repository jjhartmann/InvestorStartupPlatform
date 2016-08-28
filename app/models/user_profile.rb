class UserProfile < ApplicationRecord
  has_one :user, :as => :profilable

  validates :profession,        :presence     => true,
            :length       => { :within => 10..140 }
  validates :industry, :presence     => true,
            :length       => { :within => 10..140 }
end
