require 'digest/md5'

class User < ApplicationRecord
  include Commentable,
          Followable,
          Timming

  include RailsAdmin::UserAdmin
  include RailsAdminCharts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :omniauthable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :lockable,
         :timeoutable, :authentication_keys => [:login]

  attr_readonly :messages_count

  attr_accessor   :login

  #Upload Photo using the carrierwave
  mount_uploader :photo, PhotoUploader

  has_many :messages, -> {order 'created_at DESC'}

  # Polymopic Profile Association
  belongs_to :profilable, polymorphic: true, optional: true, :dependent => :destroy

  has_and_belongs_to_many :proposals, :join_table => :proposal_for_investors

  has_many :enterprise_users, :foreign_key => 'user_email', :primary_key => 'email'
  has_many :enterprises, :through => :enterprise_users

  has_many :target_followed,   :class_name => 'TargetFollower', :as => :follower
  has_many :users_followed,    :through => :target_followed, :source => :target, :source_type => 'User'
  has_many :enterprises_followed, :through => :target_followed, :source => :target, :source_type => 'Enterprise'
  #Association for the users that have invitations
  has_many :invitations

  has_many :offers

  accepts_nested_attributes_for :profilable

  validates :username, :presence     => true,
            :uniqueness   => { :case_sensitive => false },
            :length       => { :within => 4..100 },
            :format       => { :with => /\A[A-Za-z0-9_]*\z/ }
  validates :name,     :presence     => true,
            :length       => { :within => 4..100 }

  scope :new_users,  -> {  where :profilable => nil }
  scope :entrepreneurs, -> { joins(:enterprise_users).where('enterprise_users.user_email != nil') }
  scope :investors, ->   { where :profilable_type => 'InvestorProfile'}

  before_save :email_nomarlisation

  def incoming_messages
    comments.private_only.topics
  end

  def outgoing_messages
    messages.on_users.private_only.topics
  end

  def inbox_messages
    incoming_messages.without_proposal.unarchived
  end

  def sent_messages
    outgoing_messages.without_proposal
  end

  def archived_messages
    incoming_messages.without_proposal.archived
  end

  def inbox_proposals
    incoming_messages.with_proposal.unarchived
  end

  def sent_proposals
    outgoing_messages.with_proposal
  end

  def archived_proposals
    incoming_messages.with_proposal.archived
  end

  def has_new_messages?
    inbox_messages.unread.any?
  end

  def has_new_proposals?
    inbox_proposals.unread.any?
  end

  def is_admin?
    !!is_admin
  end

  def is_new_user?
    !is_entrepreneur? && !is_investor?
  end

  def is_entrepreneur?
    enterprises.present?
  end

  def is_investor?
    investor_profile.present?
  end

  def avatar(size = 80)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=#{size}"
  end

  def send_private_message(target_user, content, extras = {})
    messages.create!({
                         :content     => content,
                         :is_private  => true,
                         :target_id   => target_user.id,
                         :target_type => 'User'
                     }.merge(extras)) && reload
  end

  def reply_private_message(topic, content, extras = {})
    messages.create!({
                         :content     => content,
                         :is_private  => true,
                         :target_id   => topic.user.id,
                         :target_type => 'User',
                         :topic_id    => topic.id
                     }.merge(extras)) && reload
  end

  #function to send reply for message to the other user
  def new_reply_private_message(topic, content, extras = {})
    messages.create!({
                         :content     => content,
                         :is_private  => true,
                         :target_id   => topic.target.id,
                         :target_type => 'User',
                         :topic_id    => topic.id
                     }.merge(extras)) && reload
  end

  def add_micro_post(content)
    unless content.blank?
      messages.create(:content => content) && reload
      true
    else
      false
    end
  end

  def micro_posts
    messages.micro_posts
  end

  def follow(target)
    if !is_following?(target)
      target.target_followers.create(
        :follower_id   => id,
        :follower_type => self.class.name
      )

      target_id = target.class.to_s == "Enterprise" ? target.id : target.profilable.id

      target_type = target.class.to_s == "Enterprise" ? "Enterprise" : target.profilable.class

      #create notification when a user is follwed.
      Notification.create_notification(target_id, target_type, text = "#{self.name} is now following #{target.name}.") && reload unless target == self || target.nil?

      # check if the user is following the target. if yes, create a connection and notification
      unless target_type == "Enterprise"
        if is_connection?(target, self)
          puts "yay, connection-------***********************"
          Notification.create_notification(target_id, target_type, text = "#{self.name} is now #{target.name}'s connection.") && reload unless target == self || target.nil?
        end
      end
    end
  end

  def unfollow(target)
    if is_following?(target)
      target.target_followers.where(
          :follower_id   => id,
          :follower_type => self.class.name
      ).first.try(:destroy) && reload unless target.nil?
    end
  end

  def is_following?(target)
    return false if target.nil?
    !!target_followed.where(:target_id => target.id, :target_type => target.class.name).first
  end

  def followed
    users_followed + enterprises_followed
  end

  def followed_micro_posts
    Message.where(:target_id => nil, :user_id => users_followed_ids + [id]).default_order
  end

  def photo_full
    photo? ? photo : '/assets/user_50.jpg'
  end

  def photo_thumb
    photo? ? photo.thumb : '/assets/user_500.jpg'
  end

  def photo_avatar
    photo? ? photo.avatar : '/assets/user_300.jpg'
  end

  def photo_profile
    photo? ? photo.profile : '/assets/user_500.jpg'
  end

  # This function is created to count the total number of connection of the logged in user.
  # This function takes two parameters. (array of target_id, logged in user).
  # array of target_id is obtained as follows:- current_user.target_followed.pluck(:target_id).
  # current_user is the logged in user, and it is used to check is the user logged in has a connection with target user.
  def connection_counts(array,current_user)
    @count = 0
    array.each do |array_id|
      @user = User.find(array_id)
      if is_connection?(@user,current_user)
        @count = @count + 1
      end
    end
    return @count
  end

  # This function is created to verify if the user is connected to any user or not.
  # This function takes two parameters. (target user, logged in user).
  # target user is the user with whom the connection is to be checked.
  # current_user is the logged in user, and it is used to check is the user logged in is following the target user.

  #it will return false whenever the user being followed is an enterprise
  def is_connection?(user,current_user)
    return false if user.nil?
    current_user.is_following?(user) && user.is_following?(current_user)
  end

  # This function is created to count the total number of people in network of the logged in user.
  # This function takes two parameters. (array of target_id, logged in user).
  # array of target_id is obtained as follows:- current_user.target_followed.pluck(:target_id).
  # current_user is the logged in user, and it is used to check is the user logged in has a connection with target user.
  def network_counts(array,current_user)
    @count = 0
    array.each do |array_id|
      @user = User.find(array_id)
      if is_network?(@user,current_user)
        @count = @count + 1
      end
    end
    return @count
  end

  # This function is created to verify if the user is in newtork of any user or not.
  # This function takes two parameters. (target user, logged in user).
  # target user is the user with whom the network is to be checked.
  # current_user is the logged in user, and it is used to check is the user logged in is following the target user.
  def is_network?(user,current_user)
    current_user.is_following?(user) && !user.is_following?(current_user)
  end

  protected

  # Devise's support for login using the :login virtual attribute
  # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign_in-using-their-username-or-email-address
  class << self
    def find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

    def send_reset_password_instructions(attributes={})
      recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
      recoverable.send_reset_password_instructions if recoverable.persisted?
      recoverable
    end

    def find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
      (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

      attributes = attributes.slice(*required_attributes)
      attributes.delete_if { |key, value| value.blank? }

      if attributes.size == required_attributes.size
        if attributes.has_key?(:login)
          login = attributes.delete(:login)
          record = find_record(login)
        else
          record = where(attributes).first
        end
      end

      unless record
        record = new

        required_attributes.each do |key|
          value = attributes[key]
          record.send("#{key}=", value)
          record.errors.add(key, value.present? ? error : :blank)
        end
      end
      record
    end

    def find_record(login)
      where(["username = :value OR email = :value", { :value => login }]).first
    end
  end

  private

  def email_nomarlisation
    self.email = email.strip.downcase
  end
end
