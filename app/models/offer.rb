class Offer < ApplicationRecord

  #Associations
  belongs_to :proposal
  belongs_to :user

  # Validations
  validates :offer_title,                          :presence     => true,
            :length       => { :within => 10..140 }
  validates :text,                                 :presence     => true,
            :length       => { :within => 10..140 }
  validates :description,                          :presence     => true,
            :length       => { :within => 10..140 }
  validates :amount_to_offer,                      :presence     => true,
            :numericality => { :greater_than_or_equal_to => 0 }
  validates :proposal_id,                          :presence => true

end
