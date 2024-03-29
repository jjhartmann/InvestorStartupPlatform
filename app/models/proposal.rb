class Proposal < ApplicationRecord
  include RailsAdmin::ProposalAdmin
  include RailsAdminCharts

  belongs_to              :enterprise
  has_and_belongs_to_many :investors, :join_table => :proposal_for_investors, :class_name => 'User'
  has_many                :offers, dependent: :destroy

  #Upload Document using the carrierwave
  mount_uploader :document, DocumentUploader

  validates :pitch,                                :presence     => true,
            :length       => { :within => 10..140 }
  validates :introduction,                         :presence     => true,
            :length       => { :within => 10..300 }
  validates :one_year_target_audience,             :presence     => true,
            :length       => { :within => 10..300 }
  # validates :one_year_per_capita_annual_spending,  :numericality => { :greater_than_or_equal_to => 0 }
  validates :one_year_per_capita_annual_spending,  :numericality => { :greater_than_or_equal_to => 0 }
  validates :one_year_number_of_users,             :numericality => { :greater_than_or_equal_to => 0 }
  validates :one_year_market_cap,                  :presence     => true,
            :numericality => { :greater_than_or_equal_to => 0 }
  validates :one_year_penetration_rate,            :presence     => true,
            :numericality => { :less_than_or_equal_to  => 100 }
  validates :one_year_marketing_strategy,          :length       => { :within => 10..400 }
  validates :one_year_gross_profit_margin,         :presence     => true,
            :numericality => { :greater_than_or_equal_to => 0 }
  validates :five_year_target_audience,            :presence     => true,
            :length       => { :within => 10..300 }
  validates :five_year_per_capita_annual_spending, :numericality => { :greater_than_or_equal_to => 0 }
  validates :five_year_number_of_users,            :numericality => { :greater_than_or_equal_to => 0 }
  validates :five_year_market_cap,                 :presence     => true,
            :numericality => { :greater_than_or_equal_to => 0 }
  validates :five_year_penetration_rate,           :presence     => true,
            :numericality => { :less_than_or_equal_to  => 100 }
  validates :five_year_marketing_strategy,         :presence     => true,
            :length       => { :within => 10..400 }
  validates :five_year_gross_profit_margin,        :presence     => true,
            :numericality => { :greater_than_or_equal_to => 0 }
  validates :competitors_details,                  :presence     => true,
            :length       => { :within => 10..400 }
  validates :competitive_edges,                    :presence     => true,
            :length       => { :within => 10..400 }
  validates :competing_strategy,                   :presence     => true,
            :length       => { :within => 10..400 }
  validates :investment_amount,                    :presence     => true,
            :numericality => { :greater_than_or_equal_to => 0 }
  validates :investment_currency,                  :presence     => true,
            :inclusion    => { :in => Settings.currencies }
  validates :equity_percentage,                    :presence     => true,
            :numericality => { :less_than_or_equal_to => 100 }
  validates :spending_plan,                        :presence     => true,
            :length       => { :within => 10..400 }
  validates :next_investment_round,                :presence     => true,
            :numericality => { :greater_than_or_equal_to => 0 }
  validates :enterprise_id,                        :presence     => true

  scope :draft,     -> { where :proposal_stage_identifier => 'draft'}
  scope :submitted, -> { where :proposal_stage_identifier => 'submitted'}

  before_create :default_proposal_stage_identifier

  def self.stages
    I18n.t 'enterprise.proposal_stage_identifiers'
  end

  def stage
    I18n.t "enterprise.proposal_stage_identifiers.#{proposal_stage_identifier}"
  end

  def self.currencies
    Settings.currencies
  end

  def submit(investors)
    self.investors = [investors].flatten
  end

  def self.get_proposals(user)
    @user = user
    @following_enterprises = @user.enterprises_followed
    @proposals = self.where("proposals.enterprise_id IN(?) AND proposals.proposal_stage_identifier = 'submitted'", @following_enterprises.ids)
  end

  def self.get_users_proposals(user)
    @user = user
    @enterprises = @user.enterprises
    @proposals = self.where("enterprise_id IN(?)", @enterprises.ids)
  end


  private

  def default_proposal_stage_identifier
    self.proposal_stage_identifier = 'draft'
  end

end
