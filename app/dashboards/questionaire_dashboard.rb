require "administrate/base_dashboard"

class QuestionaireDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    questions: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    instruction: Field::Text,
    disclaimer: Field::Text,
    questions_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :questions,
    :id,
    :title,
    :instruction,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :questions,
    :id,
    :title,
    :instruction,
    :disclaimer,
    :questions_count,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :questions,
    :title,
    :instruction,
    :disclaimer,
    :questions_count,
  ].freeze

  # Overwrite this method to customize how questionaires are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(questionaire)
  #   "Questionaire ##{questionaire.id}"
  # end
end
