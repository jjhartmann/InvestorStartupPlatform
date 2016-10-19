module RailsAdmin::StartupFeatureAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_label 'Navigation'
      navigation_icon 'fa fa-calendar'
      label_plural 'MeetingsSchedules'

      create do
      end

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
