require "administrate/base_dashboard"

class EnterpriseUserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    enterprise: Field::BelongsTo,
    id: Field::Number,
    user_email: Field::String,
    role_identifier: Field::String,
    member_title: Field::String,
    confirmed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :enterprise,
    :id,
    :user_email,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :enterprise,
    :id,
    :user_email,
    :role_identifier,
    :member_title,
    :confirmed,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :enterprise,
    :user_email,
    :role_identifier,
    :member_title,
    :confirmed,
  ].freeze

  # Overwrite this method to customize how enterprise users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(enterprise_user)
  #   "EnterpriseUser ##{enterprise_user.id}"
  # end
end
