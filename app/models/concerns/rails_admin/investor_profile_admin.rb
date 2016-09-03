module RailsAdmin::ProposalAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'User'
      navigation_icon 'fa fa-balance-scale fa-3x'
      label_plural 'Investors'

      edit do
      end

      show do
      end

      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end
end