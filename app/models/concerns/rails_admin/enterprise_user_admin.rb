module RailsAdmin::EnterpriseUserAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Enterprise'
      navigation_icon 'fa fa-user'
      label_plural 'Employees'

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