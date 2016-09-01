module RailsAdmin::EnterpriseAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Enterprises'
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