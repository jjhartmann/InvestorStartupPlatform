require "administrate/base_dashboard"

class EnterpriseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    target_followers: Field::HasMany,
    followers: Field::HasMany.with_options(class_name: "User"),
    comments: Field::HasMany.with_options(class_name: "Message"),
    photos: Field::HasMany.with_options(class_name: "EnterprisePhoto"),
    enterprise_users: Field::HasMany,
    users: Field::HasMany,
    members: Field::HasMany.with_options(class_name: "User"),
    investors: Field::HasMany.with_options(class_name: "User"),
    advisors: Field::HasMany.with_options(class_name: "User"),
    incubators: Field::HasMany.with_options(class_name: "User"),
    proposals: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    pitch: Field::Text,
    funds_to_raise: Field::Number,
    industry: Field::String,
    enterprise_stage: Field::String,
    stage_identifier: Field::String,
    market_identifier: Field::String,
    location: Field::String,
    description: Field::Text,
    logo: Field::String,
    followers_count: Field::Number,
    followed_count: Field::Number,
    comment_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :target_followers,
    :followers,
    :comments,
    :photos,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :target_followers,
    :followers,
    :comments,
    :photos,
    :enterprise_users,
    :users,
    :members,
    :investors,
    :advisors,
    :incubators,
    :proposals,
    :id,
    :name,
    :pitch,
    :funds_to_raise,
    :industry,
    :enterprise_stage,
    :stage_identifier,
    :market_identifier,
    :location,
    :description,
    :logo,
    :followers_count,
    :followed_count,
    :comment_count,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :target_followers,
    :followers,
    :comments,
    :photos,
    :enterprise_users,
    :users,
    :members,
    :investors,
    :advisors,
    :incubators,
    :proposals,
    :name,
    :pitch,
    :funds_to_raise,
    :industry,
    :enterprise_stage,
    :stage_identifier,
    :market_identifier,
    :location,
    :description,
    :logo,
    :followers_count,
    :followed_count,
    :comment_count,
  ].freeze

  # Overwrite this method to customize how enterprises are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(enterprise)
  #   "Enterprise ##{enterprise.id}"
  # end
end
