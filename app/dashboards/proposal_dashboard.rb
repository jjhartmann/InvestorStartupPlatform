require "administrate/base_dashboard"

class ProposalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    enterprise: Field::BelongsTo,
    investors: Field::HasMany.with_options(class_name: "User"),
    id: Field::Number,
    proposal_stage_identifier: Field::String,
    new_business_model: Field::Boolean,
    new_product: Field::Boolean,
    pitch: Field::Text,
    introduction: Field::Text,
    one_year_target_audience: Field::Text,
    one_year_per_capita_annual_spending: Field::Number,
    one_year_number_of_users: Field::Number,
    one_year_market_cap: Field::Number,
    one_year_penetration_rate: Field::Number,
    one_year_marketing_strategy: Field::Text,
    one_year_gross_profit_margin: Field::Number,
    five_year_target_audience: Field::Text,
    five_year_per_capita_annual_spending: Field::Number,
    five_year_number_of_users: Field::Number,
    five_year_market_cap: Field::Number,
    five_year_penetration_rate: Field::Number,
    five_year_marketing_strategy: Field::Text,
    five_year_gross_profit_margin: Field::Number,
    competitors_details: Field::Text,
    competitive_edges: Field::Text,
    competing_strategy: Field::Text,
    investment_amount: Field::Number,
    investment_currency: Field::String,
    equity_percentage: Field::Number,
    spending_plan: Field::Text,
    next_investment_round: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :enterprise,
    :investors,
    :id,
    :proposal_stage_identifier,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :enterprise,
    :investors,
    :id,
    :proposal_stage_identifier,
    :new_business_model,
    :new_product,
    :pitch,
    :introduction,
    :one_year_target_audience,
    :one_year_per_capita_annual_spending,
    :one_year_number_of_users,
    :one_year_market_cap,
    :one_year_penetration_rate,
    :one_year_marketing_strategy,
    :one_year_gross_profit_margin,
    :five_year_target_audience,
    :five_year_per_capita_annual_spending,
    :five_year_number_of_users,
    :five_year_market_cap,
    :five_year_penetration_rate,
    :five_year_marketing_strategy,
    :five_year_gross_profit_margin,
    :competitors_details,
    :competitive_edges,
    :competing_strategy,
    :investment_amount,
    :investment_currency,
    :equity_percentage,
    :spending_plan,
    :next_investment_round,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :enterprise,
    :investors,
    :proposal_stage_identifier,
    :new_business_model,
    :new_product,
    :pitch,
    :introduction,
    :one_year_target_audience,
    :one_year_per_capita_annual_spending,
    :one_year_number_of_users,
    :one_year_market_cap,
    :one_year_penetration_rate,
    :one_year_marketing_strategy,
    :one_year_gross_profit_margin,
    :five_year_target_audience,
    :five_year_per_capita_annual_spending,
    :five_year_number_of_users,
    :five_year_market_cap,
    :five_year_penetration_rate,
    :five_year_marketing_strategy,
    :five_year_gross_profit_margin,
    :competitors_details,
    :competitive_edges,
    :competing_strategy,
    :investment_amount,
    :investment_currency,
    :equity_percentage,
    :spending_plan,
    :next_investment_round,
  ].freeze

  # Overwrite this method to customize how proposals are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(proposal)
  #   "Proposal ##{proposal.id}"
  # end
end
