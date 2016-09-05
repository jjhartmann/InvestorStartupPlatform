class InvestorProfile < ApplicationRecord
  include RailsAdmin::InvestorProfileAdmin
  include RailsAdminCharts

  has_one :user, :as => :profilable
  has_one :questionaire, :as => :questionable

  validates :tagline,        :presence     => true,
            :length       => { :within => 10..140 }
  validates :funds_to_offer, :presence     => true,
            :numericality => true

end
