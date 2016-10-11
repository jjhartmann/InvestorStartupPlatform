class Message < ApplicationRecord
  include RailsAdmin::MessageAdmin
  include RailsAdminCharts
  include Timming


  belongs_to :proposal, optional: true
  belongs_to :user, :counter_cache => :messages_count
  belongs_to :target, :polymorphic => true, :counter_cache => :comments_count, optional: true

  belongs_to :topic, :class_name => 'Message', :foreign_key => 'topic_id', optional: true
  has_many :replies, :class_name => 'Message', :foreign_key => 'topic_id'

  validates :content, :presence => true,
            :length   => { :maximum => 140 }

  scope :default_order,    -> { order 'created_at DESC'}
  scope :topics,           -> { where :topic_id =>  nil } #Syntax changed
  scope :replies,          -> { where :topic_id => !nil } #Syntax changed
  scope :public_only,      -> { where :is_private => false}
  scope :private_only,     -> { where :is_private => true}
  scope :read,             -> { where :is_read => true}
  scope :unread,           -> { where :is_read => false}
  scope :archived,         -> { where :is_archived => true}
  scope :unarchived,       -> { where :is_archived => false}
  scope :with_proposal,    -> { where :proposal_id != nil }
  scope :without_proposal, -> { where :proposal_id == nil }
  scope :micro_posts,      -> { where :target_id => nil}
  scope :on_users,         -> { where :target_type => 'User'}
  scope :on_enterprises,   -> { where :target_type => 'Enterprise'}

  def is_public?
    !is_private
  end

  def is_private?
    !!is_private
  end

  def is_with_proposal?
    !!proposal_id
  end

  def is_without_proposal?
    !proposal_id
  end

  def method_missing(symbol, *args)
    case symbol
      when /^is_(un)?(.*)\?/
        eval "#{$1 ? '!' : '!!'}is_#{$2}"
      when /^mark_as_(un)?(.*)!/
        update_attribute :"is_#{$2}", ($1 ? false : true)
      else
        super
    end
  end

  def unread_messages(current_user)
    is_read == false ? (self.replies.unread.count + 1) : self.replies.unread.count
  end
end
