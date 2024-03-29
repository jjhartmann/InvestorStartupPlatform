class TargetFollower < ApplicationRecord
  include RailsAdmin::TargetFollowerAdmin
  include RailsAdminCharts

  belongs_to :user,     :foreign_key => :follower_id
  belongs_to :follower, :polymorphic => true, :counter_cache => :followed_count
  belongs_to :target,   :polymorphic => true, :counter_cache => :followers_count
end
