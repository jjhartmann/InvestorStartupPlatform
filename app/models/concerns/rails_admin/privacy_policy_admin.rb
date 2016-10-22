module RailsAdmin::PrivacyPolicyAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Navigation'
      navigation_icon 'fa-user-secret'
      label_plural 'Privacy Policies'

      create do
        field :content, :froala
      end

      edit do
        field :content, :froala
      end

      show do
      end

      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end
end
