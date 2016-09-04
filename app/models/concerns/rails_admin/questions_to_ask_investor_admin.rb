module RailsAdmin::QuestionsToAskInvestorAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Settings'
      navigation_icon 'fa fa-gears'
      label_plural 'Investor Questions'

      edit do
      end

      show do
      end

      list do
        exclude_fields :created_at, :updated_at, :position
      end
    end
  end
end