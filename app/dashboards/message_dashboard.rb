require "administrate/base_dashboard"

class MessageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    proposal: Field::BelongsTo,
    user: Field::BelongsTo,
    target: Field::Polymorphic,
    topic: Field::BelongsTo.with_options(class_name: "Message"),
    replies: Field::HasMany.with_options(class_name: "Message"),
    id: Field::Number,
    content: Field::Text,
    is_read: Field::Boolean,
    is_private: Field::Boolean,
    is_archived: Field::Boolean,
    topic_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :proposal,
    :user,
    :target,
    :topic,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :proposal,
    :user,
    :target,
    :topic,
    :replies,
    :id,
    :content,
    :is_read,
    :is_private,
    :is_archived,
    :topic_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :proposal,
    :user,
    :target,
    :topic,
    :replies,
    :content,
    :is_read,
    :is_private,
    :is_archived,
    :topic_id,
  ].freeze

  # Overwrite this method to customize how messages are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(message)
  #   "Message ##{message.id}"
  # end
end
