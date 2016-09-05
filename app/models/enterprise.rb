class Enterprise < ApplicationRecord
  include Commentable,
          Followable,
          Paramable

  include RailsAdmin::EnterpriseAdmin
  include RailsAdminCharts

  mount_uploader :logo, LogoUploader

  has_many :photos, :class_name => 'EnterprisePhoto'

  has_many :enterprise_users
  has_many :users,      :through => :enterprise_users
  has_many :members,    -> { where 'enterprise_users.role_identifier' => 'member' }, :through => :enterprise_users, :source => :user
  has_many :investors,  -> { where 'enterprise_users.role_identifier' => 'investor' }, :through => :enterprise_users, :source => :user
  has_many :advisors,   -> { where 'enterprise_users.role_identifier' => 'advisor' }, :through => :enterprise_users, :source => :user
  has_many :incubators, -> { where 'enterprise_users.role_identifier' => 'incubator' }, :through => :enterprise_users, :source => :user

  has_many :proposals

  has_one :questionaire, :as => :questionable

  accepts_nested_attributes_for :photos, :limit => 5, :allow_destroy => true, :reject_if => :all_blank

  validates :name,              :presence     => true,
            :uniqueness   => true,
            :length       => { :within => 4..40 }
  validates :pitch,             :presence     => true,
            :length       => { :within => 10..140 }
  validates :funds_to_raise,    :presence     => true,
            :numericality => true
  validates :stage_identifier,  :presence     => true,
            :inclusion    => { :in => I18n.t('enterprise.stage_identifiers').keys.map(&:to_s) }
  validates :market_identifier, :presence     => true,
            :inclusion    => { :in => I18n.t('enterprise.market_identifiers').keys.map(&:to_s) }
  validates :description,       :presence     => true

  scope :involved, -> { where enterprise_users.role_identifier != 'investor' }
  scope :invested, -> { where enterprise_users.role_identifier == 'investor' }

  def self.stages
    I18n.t 'enterprise.stage_identifiers'
  end

  def self.markets
    I18n.t 'enterprise.market_identifiers'
  end

  def self.roles
    I18n.t 'enterprise.role_identifiers'
  end

  def stage
    I18n.t "enterprise.stage_identifiers.#{stage_identifier}"
  end

  def market
    I18n.t "enterprise.market_identifiers.#{market_identifier}"
  end

  def logo_full
    logo? ? logo : 'enterprise_460x300.png'
  end

  def logo_thumb
    logo? ? logo.thumb : 'enterprise_153x100.png'
  end

  def logo_avatar
    logo? ? logo.avatar : 'enterprise_50x50.png'
  end

  def invite_or_attach_user(role_identifier, attributes)
    user = User.find_by_email(attributes[:email]) || attributes[:email] # && TODO: send an invitation email

    attach_user(user, role_identifier, attributes[:member_title])

    # TODO: remove the confirmation and make the target user to confirm the invite manually
    confirm_user(user, role_identifier)
  end

  def attach_user(user, role_identifier = :member, member_title = '')
    enterprise_users.create(
        :user_email      => (user.is_a?(User) ? user.email : user),
        :role_identifier => role_identifier.to_s,
        :member_title    => member_title,
    ) unless user_meta(user, role_identifier)
  end

  def confirm_user(user, role_identifier = :member)
    user_meta(user, role_identifier).update_attribute(:confirmed, true)
  end

  def update_user(user, role_identifier = :member, attributes = {})
    user_meta(user, role_identifier).update_attributes(attributes)
  end

  def detach_user(user, role_identifier = :member)
    user_meta(user, role_identifier).destroy
  end

  def founder
    members.first
  end

  def user_meta(user, role_identifier = :member)
    enterprise_users.where(
        :user_email      => (user.is_a?(User) ? user.email : user),
        :role_identifier => role_identifier.to_s
    ).first
  end

  def member_title(user, role_identifier = :member)
    user_meta(user, role_identifier).member_title
  end

  def user_role(user)
    I18n.t "enterprise.role_identifiers.#{user_meta(user).role_identifier}"
  end

  def create_proposal(investors = [], attributes = {}, stage = 'draft', private_message = I18n.t('text.default_text_for_proposal_review'))
    raise Exceptions::NotAllowed if proposals.count >= Settings.enterprise.proposal.limit

    attributes['created_at'] = Time.now
    attributes['updated_at'] = Time.now

    proposal = proposals.create(attributes)
    update_and_submit_proposal(proposal, investors, attributes, stage)
    send_private_message_to_investors(proposal, investors, private_message) if stage == 'submitted'
    proposal
  end

  def update_proposal(proposal, investors = [], attributes = {}, stage = 'draft', private_message = I18n.t('text.default_text_for_proposal_review'))
    proposal.update_attributes(attributes)
    update_and_submit_proposal(proposal, investors, attributes, stage)
    send_private_message_to_investors(proposal, investors, private_message) if stage == 'submitted'
    proposal
  end

  def all_users
    members + investors + advisors + incubators
  end

  private

  def update_and_submit_proposal(proposal, investors, attributes, stage)
    proposal.update_attribute(:proposal_stage_identifier, stage)
    proposal.submit(investors)
    proposal
  end

  def send_private_message_to_investors(proposal, investors, private_message)
    [investors].flatten.each do |investor|
      founder.send_private_message(investor, private_message, :proposal_id => proposal.id)
    end
  end
end
